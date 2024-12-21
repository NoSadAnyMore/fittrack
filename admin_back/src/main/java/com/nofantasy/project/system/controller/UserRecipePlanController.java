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
import com.nofantasy.project.system.domain.UserRecipePlan;
import com.nofantasy.project.system.service.IUserRecipePlanService;
import com.nofantasy.framework.web.controller.BaseController;
import com.nofantasy.framework.web.domain.AjaxResult;
import com.nofantasy.common.utils.poi.ExcelUtil;
import com.nofantasy.framework.web.page.TableDataInfo;

/**
 * 用户菜谱计划Controller
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@RestController
@RequestMapping("/system/plan")
public class UserRecipePlanController extends BaseController
{
    @Autowired
    private IUserRecipePlanService userRecipePlanService;

    /**
     * 查询用户菜谱计划列表
     */
    @PreAuthorize("@ss.hasPermi('system:plan:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserRecipePlan userRecipePlan)
    {
        startPage();
        List<UserRecipePlan> list = userRecipePlanService.selectUserRecipePlanList(userRecipePlan);
        return getDataTable(list);
    }

    /**
     * 导出用户菜谱计划列表
     */
    @PreAuthorize("@ss.hasPermi('system:plan:export')")
    @Log(title = "用户菜谱计划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserRecipePlan userRecipePlan)
    {
        List<UserRecipePlan> list = userRecipePlanService.selectUserRecipePlanList(userRecipePlan);
        ExcelUtil<UserRecipePlan> util = new ExcelUtil<UserRecipePlan>(UserRecipePlan.class);
        util.exportExcel(response, list, "用户菜谱计划数据");
    }

    /**
     * 获取用户菜谱计划详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:plan:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(userRecipePlanService.selectUserRecipePlanById(id));
    }

    /**
     * 新增用户菜谱计划
     */
    @PreAuthorize("@ss.hasPermi('system:plan:add')")
    @Log(title = "用户菜谱计划", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserRecipePlan userRecipePlan)
    {
        return toAjax(userRecipePlanService.insertUserRecipePlan(userRecipePlan));
    }

    /**
     * 修改用户菜谱计划
     */
    @PreAuthorize("@ss.hasPermi('system:plan:edit')")
    @Log(title = "用户菜谱计划", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserRecipePlan userRecipePlan)
    {
        return toAjax(userRecipePlanService.updateUserRecipePlan(userRecipePlan));
    }

    /**
     * 删除用户菜谱计划
     */
    @PreAuthorize("@ss.hasPermi('system:plan:remove')")
    @Log(title = "用户菜谱计划", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userRecipePlanService.deleteUserRecipePlanByIds(ids));
    }
}
