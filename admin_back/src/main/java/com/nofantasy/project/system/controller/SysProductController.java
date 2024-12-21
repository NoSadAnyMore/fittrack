package com.nofantasy.project.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.nofantasy.framework.aspectj.lang.annotation.Log;
import com.nofantasy.framework.aspectj.lang.enums.BusinessType;
import com.nofantasy.project.system.domain.SysProduct;
import com.nofantasy.project.system.service.ISysProductService;
import com.nofantasy.framework.web.controller.BaseController;
import com.nofantasy.framework.web.domain.AjaxResult;
import com.nofantasy.common.utils.poi.ExcelUtil;
import com.nofantasy.framework.web.page.TableDataInfo;

/**
 * 商品信息Controller
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@RestController
@RequestMapping("/system/product")
public class SysProductController extends BaseController
{
    @Autowired
    private ISysProductService sysProductService;

    /**
     * 查询商品信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:product:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysProduct sysProduct)
    {
        startPage();
        List<SysProduct> list = sysProductService.selectSysProductList(sysProduct);
        return getDataTable(list);
    }

    /**
     * 导出商品信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:product:export')")
    @Log(title = "商品信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysProduct sysProduct)
    {
        List<SysProduct> list = sysProductService.selectSysProductList(sysProduct);
        ExcelUtil<SysProduct> util = new ExcelUtil<SysProduct>(SysProduct.class);
        util.exportExcel(response, list, "商品信息数据");
    }

    /**
     * 获取商品信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:product:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysProductService.selectSysProductById(id));
    }

    /**
     * 新增商品信息
     */
    @PreAuthorize("@ss.hasPermi('system:product:add')")
    @Log(title = "商品信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysProduct sysProduct)
    {
        return toAjax(sysProductService.insertSysProduct(sysProduct));
    }

    /**
     * 修改商品信息
     */
    @PreAuthorize("@ss.hasPermi('system:product:edit')")
    @Log(title = "商品信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysProduct sysProduct)
    {
        return toAjax(sysProductService.updateSysProduct(sysProduct));
    }

    /**
     * 删除商品信息
     */
    @PreAuthorize("@ss.hasPermi('system:product:remove')")
    @Log(title = "商品信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysProductService.deleteSysProductByIds(ids));
    }
}
