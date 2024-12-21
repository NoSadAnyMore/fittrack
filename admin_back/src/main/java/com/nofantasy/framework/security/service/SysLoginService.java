package com.nofantasy.framework.security.service;

import javax.annotation.Resource;

import com.alibaba.fastjson2.JSONObject;
import com.nofantasy.common.utils.SecurityUtils;
import com.nofantasy.project.system.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import com.nofantasy.common.constant.CacheConstants;
import com.nofantasy.common.constant.Constants;
import com.nofantasy.common.constant.UserConstants;
import com.nofantasy.common.exception.ServiceException;
import com.nofantasy.common.exception.user.BlackListException;
import com.nofantasy.common.exception.user.CaptchaException;
import com.nofantasy.common.exception.user.CaptchaExpireException;
import com.nofantasy.common.exception.user.UserNotExistsException;
import com.nofantasy.common.exception.user.UserPasswordNotMatchException;
import com.nofantasy.common.utils.DateUtils;
import com.nofantasy.common.utils.MessageUtils;
import com.nofantasy.common.utils.StringUtils;
import com.nofantasy.common.utils.ip.IpUtils;
import com.nofantasy.framework.manager.AsyncManager;
import com.nofantasy.framework.manager.factory.AsyncFactory;
import com.nofantasy.framework.redis.RedisCache;
import com.nofantasy.framework.security.LoginUser;
import com.nofantasy.framework.security.context.AuthenticationContextHolder;
import com.nofantasy.project.system.domain.SysUser;
import com.nofantasy.project.system.service.ISysConfigService;
import com.nofantasy.project.system.service.ISysUserService;

import java.util.Random;

/**
 * 登录校验方法
 * 
 * @author nofantasy
 */
@Component
public class SysLoginService
{
    @Autowired
    private TokenService tokenService;

    @Resource
    private AuthenticationManager authenticationManager;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Resource
    private SysUserMapper userMapper;

    /**
     * 登录验证
     * 
     * @param username 用户名
     * @param password 密码
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public String login(String username, String password, String code, String uuid)
    {
        // 验证码校验
        validateCaptcha(username, code, uuid);
        // 登录前置校验
        loginPreCheck(username, password);
        // 用户验证
        Authentication authentication = null;
        try
        {
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
            AuthenticationContextHolder.setContext(authenticationToken);
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager.authenticate(authenticationToken);
        }
        catch (Exception e)
        {
            if (e instanceof BadCredentialsException)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
                throw new UserPasswordNotMatchException();
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new ServiceException(e.getMessage());
            }
        }
        finally
        {
            AuthenticationContextHolder.clearContext();
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        recordLoginInfo(loginUser.getUserId());
        // 生成token
        return tokenService.createToken(loginUser);
    }

    /**
     * 校验验证码
     * 
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        if (captchaEnabled)
        {
            String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
            String captcha = redisCache.getCacheObject(verifyKey);
            if (captcha == null)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.expire")));
                throw new CaptchaExpireException();
            }
            redisCache.deleteObject(verifyKey);
            if (!code.equalsIgnoreCase(captcha))
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error")));
                throw new CaptchaException();
            }
        }
    }

    /**
     * 登录前置校验
     * @param username 用户名
     * @param password 用户密码
     */
    public void loginPreCheck(String username, String password)
    {
        // 用户名或密码为空 错误
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("not.null")));
            throw new UserNotExistsException();
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
            throw new UserPasswordNotMatchException();
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
            throw new UserPasswordNotMatchException();
        }
        // IP黑名单校验
        String blackStr = configService.selectConfigByKey("sys.login.blackIPList");
        if (IpUtils.isMatchedIp(blackStr, IpUtils.getIpAddr()))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("login.blocked")));
            throw new BlackListException();
        }
    }

    /**
     * 记录登录信息
     *
     * @param userId 用户ID
     */
    public void recordLoginInfo(Long userId)
    {
        SysUser sysUser = new SysUser();
        sysUser.setUserId(userId);
        sysUser.setLoginIp(IpUtils.getIpAddr());
        sysUser.setLoginDate(DateUtils.getNowDate());
        userService.updateUserProfile(sysUser);
    }
    /**
     * 微信登录
     *
     * @param decryptResult 登录凭证 只能用一次
     * @return
     */
    public String wxLogin(String decryptResult,String avatarUrl){
        //字符串转json
        JSONObject jsonObject = JSONObject.parseObject(decryptResult);
        //        String unionid = jsonObject.getString("unionid");
        String openId = jsonObject.getString("openId");
        System.out.println("openId"+openId);
        //获取nickName
        String nickName ="微信用户"+getStringRandom(8);// 生成16位随机昵称
        //获取头像
        //还可以获取其他信息
        //根据openid判断数据库中是否有该用户
        //根据openid查询用户信息
        SysUser wxUser = userMapper.selectWxUserByOpenId(openId);

        //如果查不到，则新增，查到了，则更新
        SysUser user = new SysUser();
        if (wxUser == null) {
            // 新增
            user.setUserName(getStringRandom(8));// 生成16位随机用户名
            user.setNickName(nickName);
            user.setAvatar(avatarUrl);
            user.setOpenId(openId);
            user.setCreateTime(DateUtils.getNowDate());
            user.setPassword(SecurityUtils.encryptPassword("123456"));
            //新增 用户
            userService.insertUser(user);
        }else {
            //更新
            user = wxUser;
            user.setNickName(nickName);
            user.setAvatar(avatarUrl);
            user.setUpdateTime(DateUtils.getNowDate());
            userMapper.updateUser(user);
        }

        //组装token信息
        LoginUser loginUser = new LoginUser();
        loginUser.setOpenId(openId);
        //如果有的话设置
        loginUser.setUser(user);
        loginUser.setUserId(user.getUserId());

        // 生成token
        return tokenService.createToken(loginUser);
    }

    //生成随机用户名，数字和字母组成,
    public static String getStringRandom(int length) {

        String val = "";
        Random random = new Random();

        //参数length，表示生成几位随机数
        for (int i = 0; i < length; i++) {

            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            //输出字母还是数字
            if ("char".equalsIgnoreCase(charOrNum)) {
                //输出是大写字母还是小写字母
                int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
                val += (char) (random.nextInt(26) + temp);
            } else if ("num".equalsIgnoreCase(charOrNum)) {
                val += String.valueOf(random.nextInt(10));
            }
        }
        return val;
    }

}
