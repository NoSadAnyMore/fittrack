package com.nofantasy.project.system.domain;

import com.nofantasy.framework.aspectj.lang.annotation.Excel;
import com.nofantasy.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户菜谱计划对象 user_recipe_plan
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public class UserRecipePlan extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 类型 */
    @Excel(name = "类型")
    private String type;

    /** 菜谱名称 */
    @Excel(name = "菜谱名称")
    private String name;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 图片 */
    @Excel(name = "图片")
    private String image;

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
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setImage(String image) 
    {
        this.image = image;
    }

    public String getImage() 
    {
        return image;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("type", getType())
            .append("name", getName())
            .append("description", getDescription())
            .append("image", getImage())
            .toString();
    }
}
