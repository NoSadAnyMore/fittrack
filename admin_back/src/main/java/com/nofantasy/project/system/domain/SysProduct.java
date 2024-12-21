package com.nofantasy.project.system.domain;

import com.nofantasy.framework.aspectj.lang.annotation.Excel;
import com.nofantasy.framework.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 商品信息对象 sys_product
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public class SysProduct extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 图片 */
    @Excel(name = "图片")
    private String img;

    /** 商品名称 */
    @Excel(name = "商品名称")
    private String name;

    /** 商品描述 */
    @Excel(name = "商品描述")
    private String descript;

    /** 兑换积分 */
    @Excel(name = "兑换积分")
    private String needJf;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setImg(String img) 
    {
        this.img = img;
    }

    public String getImg() 
    {
        return img;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setDescript(String descript) 
    {
        this.descript = descript;
    }

    public String getDescript() 
    {
        return descript;
    }
    public void setNeedJf(String needJf) 
    {
        this.needJf = needJf;
    }

    public String getNeedJf() 
    {
        return needJf;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("img", getImg())
            .append("name", getName())
            .append("descript", getDescript())
            .append("needJf", getNeedJf())
            .toString();
    }
}
