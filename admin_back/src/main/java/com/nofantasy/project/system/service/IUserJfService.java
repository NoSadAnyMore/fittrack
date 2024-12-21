package com.nofantasy.project.system.service;

import java.util.List;
import com.nofantasy.project.system.domain.UserJf;

/**
 * 用户积分Service接口
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public interface IUserJfService 
{
    /**
     * 查询用户积分
     * 
     * @param id 用户积分主键
     * @return 用户积分
     */
    public UserJf selectUserJfById(Long id);

    /**
     * 查询用户积分列表
     * 
     * @param userJf 用户积分
     * @return 用户积分集合
     */
    public List<UserJf> selectUserJfList(UserJf userJf);

    /**
     * 新增用户积分
     * 
     * @param userJf 用户积分
     * @return 结果
     */
    public int insertUserJf(UserJf userJf);

    /**
     * 修改用户积分
     * 
     * @param userJf 用户积分
     * @return 结果
     */
    public int updateUserJf(UserJf userJf);

    /**
     * 批量删除用户积分
     * 
     * @param ids 需要删除的用户积分主键集合
     * @return 结果
     */
    public int deleteUserJfByIds(Long[] ids);

    /**
     * 删除用户积分信息
     * 
     * @param id 用户积分主键
     * @return 结果
     */
    public int deleteUserJfById(Long id);
}
