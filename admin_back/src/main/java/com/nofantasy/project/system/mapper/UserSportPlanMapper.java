package com.nofantasy.project.system.mapper;

import java.util.List;
import com.nofantasy.project.system.domain.UserSportPlan;

/**
 * 用户运动计划Mapper接口
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public interface UserSportPlanMapper 
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
     * 删除用户运动计划
     * 
     * @param id 用户运动计划主键
     * @return 结果
     */
    public int deleteUserSportPlanById(Long id);

    /**
     * 批量删除用户运动计划
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteUserSportPlanByIds(Long[] ids);
}
