package com.nofantasy.project.system.domain;

import com.nofantasy.framework.aspectj.lang.annotation.Excel;
import com.nofantasy.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户运动记录对象 user_run_record
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public class UserRunRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 时长 */
    @Excel(name = "时长")
    private String times;

    /** 时速 */
    @Excel(name = "时速")
    private Long speed;

    /** 公里数 */
    @Excel(name = "公里数")
    private Long distance;

    /** 卡路里 */
    @Excel(name = "卡路里")
    private String calories;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long useerId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTimes(String times) 
    {
        this.times = times;
    }

    public String getTimes() 
    {
        return times;
    }
    public void setSpeed(Long speed) 
    {
        this.speed = speed;
    }

    public Long getSpeed() 
    {
        return speed;
    }
    public void setDistance(Long distance) 
    {
        this.distance = distance;
    }

    public Long getDistance() 
    {
        return distance;
    }
    public void setCalories(String calories) 
    {
        this.calories = calories;
    }

    public String getCalories() 
    {
        return calories;
    }
    public void setUseerId(Long useerId) 
    {
        this.useerId = useerId;
    }

    public Long getUseerId() 
    {
        return useerId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("times", getTimes())
            .append("speed", getSpeed())
            .append("distance", getDistance())
            .append("calories", getCalories())
            .append("useerId", getUseerId())
            .toString();
    }
}
