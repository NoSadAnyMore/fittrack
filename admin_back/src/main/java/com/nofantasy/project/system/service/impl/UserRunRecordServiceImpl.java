package com.nofantasy.project.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nofantasy.project.system.mapper.UserRunRecordMapper;
import com.nofantasy.project.system.domain.UserRunRecord;
import com.nofantasy.project.system.service.IUserRunRecordService;

/**
 * 用户运动记录Service业务层处理
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@Service
public class UserRunRecordServiceImpl implements IUserRunRecordService 
{
    @Autowired
    private UserRunRecordMapper userRunRecordMapper;

    /**
     * 查询用户运动记录
     * 
     * @param id 用户运动记录主键
     * @return 用户运动记录
     */
    @Override
    public UserRunRecord selectUserRunRecordById(Long id)
    {
        return userRunRecordMapper.selectUserRunRecordById(id);
    }

    /**
     * 查询用户运动记录列表
     * 
     * @param userRunRecord 用户运动记录
     * @return 用户运动记录
     */
    @Override
    public List<UserRunRecord> selectUserRunRecordList(UserRunRecord userRunRecord)
    {
        return userRunRecordMapper.selectUserRunRecordList(userRunRecord);
    }

    /**
     * 新增用户运动记录
     * 
     * @param userRunRecord 用户运动记录
     * @return 结果
     */
    @Override
    public int insertUserRunRecord(UserRunRecord userRunRecord)
    {
        return userRunRecordMapper.insertUserRunRecord(userRunRecord);
    }

    /**
     * 修改用户运动记录
     * 
     * @param userRunRecord 用户运动记录
     * @return 结果
     */
    @Override
    public int updateUserRunRecord(UserRunRecord userRunRecord)
    {
        return userRunRecordMapper.updateUserRunRecord(userRunRecord);
    }

    /**
     * 批量删除用户运动记录
     * 
     * @param ids 需要删除的用户运动记录主键
     * @return 结果
     */
    @Override
    public int deleteUserRunRecordByIds(Long[] ids)
    {
        return userRunRecordMapper.deleteUserRunRecordByIds(ids);
    }

    /**
     * 删除用户运动记录信息
     * 
     * @param id 用户运动记录主键
     * @return 结果
     */
    @Override
    public int deleteUserRunRecordById(Long id)
    {
        return userRunRecordMapper.deleteUserRunRecordById(id);
    }
}
