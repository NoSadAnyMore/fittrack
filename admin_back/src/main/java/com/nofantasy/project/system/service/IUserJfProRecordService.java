package com.nofantasy.project.system.service;

import java.util.List;
import com.nofantasy.project.system.domain.UserJfProRecord;

/**
 * 用户积分兑换记录Service接口
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public interface IUserJfProRecordService 
{
    /**
     * 查询用户积分兑换记录
     * 
     * @param id 用户积分兑换记录主键
     * @return 用户积分兑换记录
     */
    public UserJfProRecord selectUserJfProRecordById(Long id);

    /**
     * 查询用户积分兑换记录列表
     * 
     * @param userJfProRecord 用户积分兑换记录
     * @return 用户积分兑换记录集合
     */
    public List<UserJfProRecord> selectUserJfProRecordList(UserJfProRecord userJfProRecord);

    /**
     * 新增用户积分兑换记录
     * 
     * @param userJfProRecord 用户积分兑换记录
     * @return 结果
     */
    public int insertUserJfProRecord(UserJfProRecord userJfProRecord);

    /**
     * 修改用户积分兑换记录
     * 
     * @param userJfProRecord 用户积分兑换记录
     * @return 结果
     */
    public int updateUserJfProRecord(UserJfProRecord userJfProRecord);

    /**
     * 批量删除用户积分兑换记录
     * 
     * @param ids 需要删除的用户积分兑换记录主键集合
     * @return 结果
     */
    public int deleteUserJfProRecordByIds(Long[] ids);

    /**
     * 删除用户积分兑换记录信息
     * 
     * @param id 用户积分兑换记录主键
     * @return 结果
     */
    public int deleteUserJfProRecordById(Long id);
}
