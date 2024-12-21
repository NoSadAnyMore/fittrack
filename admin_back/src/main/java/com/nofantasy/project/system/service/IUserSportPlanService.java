package com.nofantasy.project.system.service;

import java.util.List;
import com.nofantasy.project.system.domain.UserSportPlan;

/**
 * 用户运动计划Service接口
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public interface IUserSportPlanService 
{
    /**
     * 查询用户运动计划
     * 
     * @param id 用户运动计划主键
     * @return 用户运动计划
     */
    public UserSportPlan selectUserSportPlanById(Long id);

    /**
     * 查询用户运动计划列表
     * 
     * @param userSportPlan 用户运动计划
     * @return 用户运动计划集合
     */
    public List<UserSportPlan> selectUserSportPlanList(UserSportPlan userSportPlan);

    /**
     * 新增用户运动计划
     * 
     * @param userSportPlan 用户运动计划
     * @return 结果
     */
    public int insertUserSportPlan(UserSportPlan userSportPlan);

    /**
     * 修改用户运动计划
     * 
     * @param userSportPlan 用户运动计划
     * @return 结果
     */
    public int updateUserSportPlan(UserSportPlan userSportPlan);

    /**
     * 批量删除用户运动计划
     * 
     * @param ids 需要删除的用户运动计划主键集合
     * @return 结果
     */
    public int deleteUserSportPlanByIds(Long[] ids);

    /**
     * 删除用户运动计划信息
     * 
     * @param id 用户运动计划主键
     * @return 结果
     */
    public int deleteUserSportPlanById(Long id);
}
