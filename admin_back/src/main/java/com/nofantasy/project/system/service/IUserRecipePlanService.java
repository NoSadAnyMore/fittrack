package com.nofantasy.project.system.service;

import java.util.List;
import com.nofantasy.project.system.domain.UserRecipePlan;

/**
 * 用户菜谱计划Service接口
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public interface IUserRecipePlanService 
{
    /**
     * 查询用户菜谱计划
     * 
     * @param id 用户菜谱计划主键
     * @return 用户菜谱计划
     */
    public UserRecipePlan selectUserRecipePlanById(Long id);

    /**
     * 查询用户菜谱计划列表
     * 
     * @param userRecipePlan 用户菜谱计划
     * @return 用户菜谱计划集合
     */
    public List<UserRecipePlan> selectUserRecipePlanList(UserRecipePlan userRecipePlan);

    /**
     * 新增用户菜谱计划
     * 
     * @param userRecipePlan 用户菜谱计划
     * @return 结果
     */
    public int insertUserRecipePlan(UserRecipePlan userRecipePlan);

    /**
     * 修改用户菜谱计划
     * 
     * @param userRecipePlan 用户菜谱计划
     * @return 结果
     */
    public int updateUserRecipePlan(UserRecipePlan userRecipePlan);

    /**
     * 批量删除用户菜谱计划
     * 
     * @param ids 需要删除的用户菜谱计划主键集合
     * @return 结果
     */
    public int deleteUserRecipePlanByIds(Long[] ids);

    /**
     * 删除用户菜谱计划信息
     * 
     * @param id 用户菜谱计划主键
     * @return 结果
     */
    public int deleteUserRecipePlanById(Long id);
}
