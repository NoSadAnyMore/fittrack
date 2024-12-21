package com.nofantasy.project.system.service.impl;

import java.util.List;
import com.nofantasy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nofantasy.project.system.mapper.UserJfMapper;
import com.nofantasy.project.system.domain.UserJf;
import com.nofantasy.project.system.service.IUserJfService;

/**
 * 用户积分Service业务层处理
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@Service
public class UserJfServiceImpl implements IUserJfService 
{
    @Autowired
    private UserJfMapper userJfMapper;

    /**
     * 查询用户积分
     * 
     * @param id 用户积分主键
     * @return 用户积分
     */
    @Override
    public UserJf selectUserJfById(Long id)
    {
        return userJfMapper.selectUserJfById(id);
    }

    /**
     * 查询用户积分列表
     * 
     * @param userJf 用户积分
     * @return 用户积分
     */
    @Override
    public List<UserJf> selectUserJfList(UserJf userJf)
    {
        return userJfMapper.selectUserJfList(userJf);
    }

    /**
     * 新增用户积分
     * 
     * @param userJf 用户积分
     * @return 结果
     */
    @Override
    public int insertUserJf(UserJf userJf)
    {
        userJf.setCreateTime(DateUtils.getNowDate());
        return userJfMapper.insertUserJf(userJf);
    }

    /**
     * 修改用户积分
     * 
     * @param userJf 用户积分
     * @return 结果
     */
    @Override
    public int updateUserJf(UserJf userJf)
    {
        return userJfMapper.updateUserJf(userJf);
    }

    /**
     * 批量删除用户积分
     * 
     * @param ids 需要删除的用户积分主键
     * @return 结果
     */
    @Override
    public int deleteUserJfByIds(Long[] ids)
    {
        return userJfMapper.deleteUserJfByIds(ids);
    }

    /**
     * 删除用户积分信息
     * 
     * @param id 用户积分主键
     * @return 结果
     */
    @Override
    public int deleteUserJfById(Long id)
    {
        return userJfMapper.deleteUserJfById(id);
    }
}
