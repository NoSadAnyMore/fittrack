package com.nofantasy.project.system.domain;

import com.nofantasy.framework.aspectj.lang.annotation.Excel;
import com.nofantasy.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户积分兑换记录对象 user_jf_pro_record
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public class UserJfProRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 消耗积分 */
    @Excel(name = "消耗积分")
    private String xhJf;

    /** 商品ID */
    @Excel(name = "商品ID")
    private Long proId;

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
    public void setXhJf(String xhJf) 
    {
        this.xhJf = xhJf;
    }

    public String getXhJf() 
    {
        return xhJf;
    }
    public void setProId(Long proId) 
    {
        this.proId = proId;
    }

    public Long getProId() 
    {
        return proId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("xhJf", getXhJf())
            .append("proId", getProId())
            .append("createTime", getCreateTime())
            .toString();
    }
}
