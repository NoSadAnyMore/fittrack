package com.nofantasy.project.system.service.impl;

import java.util.List;
import com.nofantasy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nofantasy.project.system.mapper.UserJfProRecordMapper;
import com.nofantasy.project.system.domain.UserJfProRecord;
import com.nofantasy.project.system.service.IUserJfProRecordService;

/**
 * 用户积分兑换记录Service业务层处理
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@Service
public class UserJfProRecordServiceImpl implements IUserJfProRecordService 
{
    @Autowired
    private UserJfProRecordMapper userJfProRecordMapper;

    /**
     * 查询用户积分兑换记录
     * 
     * @param id 用户积分兑换记录主键
     * @return 用户积分兑换记录
     */
    @Override
    public UserJfProRecord selectUserJfProRecordById(Long id)
    {
        return userJfProRecordMapper.selectUserJfProRecordById(id);
    }

    /**
     * 查询用户积分兑换记录列表
     * 
     * @param userJfProRecord 用户积分兑换记录
     * @return 用户积分兑换记录
     */
    @Override
    public List<UserJfProRecord> selectUserJfProRecordList(UserJfProRecord userJfProRecord)
    {
        return userJfProRecordMapper.selectUserJfProRecordList(userJfProRecord);
    }

    /**
     * 新增用户积分兑换记录
     * 
     * @param userJfProRecord 用户积分兑换记录
     * @return 结果
     */
    @Override
    public int insertUserJfProRecord(UserJfProRecord userJfProRecord)
    {
        userJfProRecord.setCreateTime(DateUtils.getNowDate());
        return userJfProRecordMapper.insertUserJfProRecord(userJfProRecord);
    }

    /**
     * 修改用户积分兑换记录
     * 
     * @param userJfProRecord 用户积分兑换记录
     * @return 结果
     */
    @Override
    public int updateUserJfProRecord(UserJfProRecord userJfProRecord)
    {
        return userJfProRecordMapper.updateUserJfProRecord(userJfProRecord);
    }

    /**
     * 批量删除用户积分兑换记录
     * 
     * @param ids 需要删除的用户积分兑换记录主键
     * @return 结果
     */
    @Override
    public int deleteUserJfProRecordByIds(Long[] ids)
    {
        return userJfProRecordMapper.deleteUserJfProRecordByIds(ids);
    }

    /**
     * 删除用户积分兑换记录信息
     * 
     * @param id 用户积分兑换记录主键
     * @return 结果
     */
    @Override
    public int deleteUserJfProRecordById(Long id)
    {
        return userJfProRecordMapper.deleteUserJfProRecordById(id);
    }
}
