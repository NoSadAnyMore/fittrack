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
import com.nofantasy.project.system.domain.UserJf;
import com.nofantasy.project.system.service.IUserJfService;
import com.nofantasy.framework.web.controller.BaseController;
import com.nofantasy.framework.web.domain.AjaxResult;
import com.nofantasy.common.utils.poi.ExcelUtil;
import com.nofantasy.framework.web.page.TableDataInfo;

/**
 * 用户积分Controller
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@RestController
@RequestMapping("/system/jf")
public class UserJfController extends BaseController
{
    @Autowired
    private IUserJfService userJfService;

    /**
     * 查询用户积分列表
     */
    @PreAuthorize("@ss.hasPermi('system:jf:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserJf userJf)
    {
        startPage();
        List<UserJf> list = userJfService.selectUserJfList(userJf);
        return getDataTable(list);
    }

    /**
     * 导出用户积分列表
     */
    @PreAuthorize("@ss.hasPermi('system:jf:export')")
    @Log(title = "用户积分", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserJf userJf)
    {
        List<UserJf> list = userJfService.selectUserJfList(userJf);
        ExcelUtil<UserJf> util = new ExcelUtil<UserJf>(UserJf.class);
        util.exportExcel(response, list, "用户积分数据");
    }

    /**
     * 获取用户积分详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jf:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(userJfService.selectUserJfById(id));
    }

    /**
     * 新增用户积分
     */
    @PreAuthorize("@ss.hasPermi('system:jf:add')")
    @Log(title = "用户积分", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserJf userJf)
    {
        return toAjax(userJfService.insertUserJf(userJf));
    }

    /**
     * 修改用户积分
     */
    @PreAuthorize("@ss.hasPermi('system:jf:edit')")
    @Log(title = "用户积分", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserJf userJf)
    {
        return toAjax(userJfService.updateUserJf(userJf));
    }

    /**
     * 删除用户积分
     */
    @PreAuthorize("@ss.hasPermi('system:jf:remove')")
    @Log(title = "用户积分", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userJfService.deleteUserJfByIds(ids));
    }
}
