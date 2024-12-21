package com.nofantasy.project.system.service;

import java.util.List;
import com.nofantasy.project.system.domain.UserRunRecord;

/**
 * 用户运动记录Service接口
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public interface IUserRunRecordService 
{
    /**
     * 查询用户运动记录
     * 
     * @param id 用户运动记录主键
     * @return 用户运动记录
     */
    public UserRunRecord selectUserRunRecordById(Long id);

    /**
     * 查询用户运动记录列表
     * 
     * @param userRunRecord 用户运动记录
     * @return 用户运动记录集合
     */
    public List<UserRunRecord> selectUserRunRecordList(UserRunRecord userRunRecord);

    /**
     * 新增用户运动记录
     * 
     * @param userRunRecord 用户运动记录
     * @return 结果
     */
    public int insertUserRunRecord(UserRunRecord userRunRecord);

    /**
     * 修改用户运动记录
     * 
     * @param userRunRecord 用户运动记录
     * @return 结果
     */
    public int updateUserRunRecord(UserRunRecord userRunRecord);

    /**
     * 批量删除用户运动记录
     * 
     * @param ids 需要删除的用户运动记录主键集合
     * @return 结果
     */
    public int deleteUserRunRecordByIds(Long[] ids);

    /**
     * 删除用户运动记录信息
     * 
     * @param id 用户运动记录主键
     * @return 结果
     */
    public int deleteUserRunRecordById(Long id);
}
