package com.nofantasy.project.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nofantasy.project.system.mapper.UserRecipePlanMapper;
import com.nofantasy.project.system.domain.UserRecipePlan;
import com.nofantasy.project.system.service.IUserRecipePlanService;

/**
 * 用户菜谱计划Service业务层处理
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@Service
public class UserRecipePlanServiceImpl implements IUserRecipePlanService 
{
    @Autowired
    private UserRecipePlanMapper userRecipePlanMapper;

    /**
     * 查询用户菜谱计划
     * 
     * @param id 用户菜谱计划主键
     * @return 用户菜谱计划
     */
    @Override
    public UserRecipePlan selectUserRecipePlanById(Long id)
    {
        return userRecipePlanMapper.selectUserRecipePlanById(id);
    }

    /**
     * 查询用户菜谱计划列表
     * 
     * @param userRecipePlan 用户菜谱计划
     * @return 用户菜谱计划
     */
    @Override
    public List<UserRecipePlan> selectUserRecipePlanList(UserRecipePlan userRecipePlan)
    {
        return userRecipePlanMapper.selectUserRecipePlanList(userRecipePlan);
    }

    /**
     * 新增用户菜谱计划
     * 
     * @param userRecipePlan 用户菜谱计划
     * @return 结果
     */
    @Override
    public int insertUserRecipePlan(UserRecipePlan userRecipePlan)
    {
        return userRecipePlanMapper.insertUserRecipePlan(userRecipePlan);
    }

    /**
     * 修改用户菜谱计划
     * 
     * @param userRecipePlan 用户菜谱计划
     * @return 结果
     */
    @Override
    public int updateUserRecipePlan(UserRecipePlan userRecipePlan)
    {
        return userRecipePlanMapper.updateUserRecipePlan(userRecipePlan);
    }

    /**
     * 批量删除用户菜谱计划
     * 
     * @param ids 需要删除的用户菜谱计划主键
     * @return 结果
     */
    @Override
    public int deleteUserRecipePlanByIds(Long[] ids)
    {
        return userRecipePlanMapper.deleteUserRecipePlanByIds(ids);
    }

    /**
     * 删除用户菜谱计划信息
     * 
     * @param id 用户菜谱计划主键
     * @return 结果
     */
    @Override
    public int deleteUserRecipePlanById(Long id)
    {
        return userRecipePlanMapper.deleteUserRecipePlanById(id);
    }
}
