package com.nofantasy.project.system.mapper;

import java.util.List;
import com.nofantasy.project.system.domain.SysProduct;

/**
 * 商品信息Mapper接口
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
public interface SysProductMapper 
{
    /**
     * 查询商品信息
     * 
     * @param id 商品信息主键
     * @return 商品信息
     */
    public SysProduct selectSysProductById(Long id);

    /**
     * 查询商品信息列表
     * 
     * @param sysProduct 商品信息
     * @return 商品信息集合
     */
    public List<SysProduct> selectSysProductList(SysProduct sysProduct);

    /**
     * 新增商品信息
     * 
     * @param sysProduct 商品信息
     * @return 结果
     */
    public int insertSysProduct(SysProduct sysProduct);

    /**
     * 修改商品信息
     * 
     * @param sysProduct 商品信息
     * @return 结果
     */
    public int updateSysProduct(SysProduct sysProduct);

    /**
     * 删除商品信息
     * 
     * @param id 商品信息主键
     * @return 结果
     */
    public int deleteSysProductById(Long id);

    /**
     * 批量删除商品信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysProductByIds(Long[] ids);
}
