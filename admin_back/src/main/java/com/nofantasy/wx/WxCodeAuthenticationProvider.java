package com.nofantasy.wx;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @Author jeremy 17344995941@163.com
 * @Description :com.nofantasy.wx
 * @Date:Created in   2024/12/5
 */
public class WxCodeAuthenticationProvider implements AuthenticationProvider {

    private UserDetailsService userDetailsService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        WxCodeAuthenticationToken authenticationToken = (WxCodeAuthenticationToken) authentication;

        String openId = (String) authenticationToken.getPrincipal();

        UserDetails userDetails = userDetailsService.loadUserByUsername(openId);

        // 此时鉴权成功后，应当重新 new 一个拥有鉴权的 authenticationResult 返回
        WxCodeAuthenticationToken authenticationResult = new WxCodeAuthenticationToken(userDetails, userDetails.getAuthorities());

        authenticationResult.setDetails(authenticationToken.getDetails());

        return authenticationResult;
    }


    @Override
    public boolean supports(Class<?> authentication) {
        // 判断 authentication 是不是 WxCodeAuthenticationToken 的子类或子接口
        return WxCodeAuthenticationToken.class.isAssignableFrom(authentication);
    }

    public UserDetailsService getUserDetailsService() {
        return userDetailsService;
    }

    public void setUserDetailsService(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }
}
