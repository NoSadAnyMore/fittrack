package com.nofantasy.project.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nofantasy.project.system.mapper.SysProductMapper;
import com.nofantasy.project.system.domain.SysProduct;
import com.nofantasy.project.system.service.ISysProductService;

/**
 * 商品信息Service业务层处理
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@Service
public class SysProductServiceImpl implements ISysProductService 
{
    @Autowired
    private SysProductMapper sysProductMapper;

    /**
     * 查询商品信息
     * 
     * @param id 商品信息主键
     * @return 商品信息
     */
    @Override
    public SysProduct selectSysProductById(Long id)
    {
        return sysProductMapper.selectSysProductById(id);
    }

    /**
     * 查询商品信息列表
     * 
     * @param sysProduct 商品信息
     * @return 商品信息
     */
    @Override
    public List<SysProduct> selectSysProductList(SysProduct sysProduct)
    {
        return sysProductMapper.selectSysProductList(sysProduct);
    }

    /**
     * 新增商品信息
     * 
     * @param sysProduct 商品信息
     * @return 结果
     */
    @Override
    public int insertSysProduct(SysProduct sysProduct)
    {
        return sysProductMapper.insertSysProduct(sysProduct);
    }

    /**
     * 修改商品信息
     * 
     * @param sysProduct 商品信息
     * @return 结果
     */
    @Override
    public int updateSysProduct(SysProduct sysProduct)
    {
        return sysProductMapper.updateSysProduct(sysProduct);
    }

    /**
     * 批量删除商品信息
     * 
     * @param ids 需要删除的商品信息主键
     * @return 结果
     */
    @Override
    public int deleteSysProductByIds(Long[] ids)
    {
        return sysProductMapper.deleteSysProductByIds(ids);
    }

    /**
     * 删除商品信息信息
     * 
     * @param id 商品信息主键
     * @return 结果
     */
    @Override
    public int deleteSysProductById(Long id)
    {
        return sysProductMapper.deleteSysProductById(id);
    }
}
