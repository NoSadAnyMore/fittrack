package com.nofantasy.project.system.service.impl;

import java.util.List;
import com.nofantasy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nofantasy.project.system.mapper.UserSportPlanMapper;
import com.nofantasy.project.system.domain.UserSportPlan;
import com.nofantasy.project.system.service.IUserSportPlanService;

/**
 * 用户运动计划Service业务层处理
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@Service
public class UserSportPlanServiceImpl implements IUserSportPlanService 
{
    @Autowired
    private UserSportPlanMapper userSportPlanMapper;

    /**
     * 查询用户运动计划
     * 
     * @param id 用户运动计划主键
     * @return 用户运动计划
     */
    @Override
    public UserSportPlan selectUserSportPlanById(Long id)
    {
        return userSportPlanMapper.selectUserSportPlanById(id);
    }

    /**
     * 查询用户运动计划列表
     * 
     * @param userSportPlan 用户运动计划
     * @return 用户运动计划
     */
    @Override
    public List<UserSportPlan> selectUserSportPlanList(UserSportPlan userSportPlan)
    {
        return userSportPlanMapper.selectUserSportPlanList(userSportPlan);
    }

    /**
     * 新增用户运动计划
     * 
     * @param userSportPlan 用户运动计划
     * @return 结果
     */
    @Override
    public int insertUserSportPlan(UserSportPlan userSportPlan)
    {
        userSportPlan.setCreateTime(DateUtils.getNowDate());
        return userSportPlanMapper.insertUserSportPlan(userSportPlan);
    }

    /**
     * 修改用户运动计划
     * 
     * @param userSportPlan 用户运动计划
     * @return 结果
     */
    @Override
    public int updateUserSportPlan(UserSportPlan userSportPlan)
    {
        return userSportPlanMapper.updateUserSportPlan(userSportPlan);
    }

    /**
     * 批量删除用户运动计划
     * 
     * @param ids 需要删除的用户运动计划主键
     * @return 结果
     */
    @Override
    public int deleteUserSportPlanByIds(Long[] ids)
    {
        return userSportPlanMapper.deleteUserSportPlanByIds(ids);
    }

    /**
     * 删除用户运动计划信息
     * 
     * @param id 用户运动计划主键
     * @return 结果
     */
    @Override
    public int deleteUserSportPlanById(Long id)
    {
        return userSportPlanMapper.deleteUserSportPlanById(id);
    }
}
