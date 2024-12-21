package com.nofantasy.project.system.domain;

import com.nofantasy.framework.aspectj.lang.annotation.Excel;
import com.nofantasy.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户运动计划对象 user_sport_plan
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public class UserSportPlan extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 身高 */
    @Excel(name = "身高")
    private Long height;

    /** 体重 */
    @Excel(name = "体重")
    private String weight;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String age;

    /** 性别 */
    @Excel(name = "性别")
    private String gender;

    /** 目标卡路里 */
    @Excel(name = "目标卡路里")
    private String calories;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setHeight(Long height) 
    {
        this.height = height;
    }

    public Long getHeight() 
    {
        return height;
    }
    public void setWeight(String weight) 
    {
        this.weight = weight;
    }

    public String getWeight() 
    {
        return weight;
    }
    public void setAge(String age) 
    {
        this.age = age;
    }

    public String getAge() 
    {
        return age;
    }
    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }
    public void setCalories(String calories) 
    {
        this.calories = calories;
    }

    public String getCalories() 
    {
        return calories;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("height", getHeight())
            .append("weight", getWeight())
            .append("age", getAge())
            .append("gender", getGender())
            .append("calories", getCalories())
            .append("createTime", getCreateTime())
            .toString();
    }
}
