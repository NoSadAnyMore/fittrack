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
import com.nofantasy.project.system.domain.UserSportPlan;
import com.nofantasy.project.system.service.IUserSportPlanService;
import com.nofantasy.framework.web.controller.BaseController;
import com.nofantasy.framework.web.domain.AjaxResult;
import com.nofantasy.common.utils.poi.ExcelUtil;
import com.nofantasy.framework.web.page.TableDataInfo;

/**
 * 用户运动计划Controller
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@RestController
@RequestMapping("/system/sportP2lan")
public class UserSportPlanController extends BaseController
{
    @Autowired
    private IUserSportPlanService userSportPlanService;

    /**
     * 查询用户运动计划列表
     */
    @PreAuthorize("@ss.hasPermi('system:plan:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserSportPlan userSportPlan)
    {
        startPage();
        List<UserSportPlan> list = userSportPlanService.selectUserSportPlanList(userSportPlan);
        return getDataTable(list);
    }

    /**
     * 导出用户运动计划列表
     */
    @PreAuthorize("@ss.hasPermi('system:plan:export')")
    @Log(title = "用户运动计划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserSportPlan userSportPlan)
    {
        List<UserSportPlan> list = userSportPlanService.selectUserSportPlanList(userSportPlan);
        ExcelUtil<UserSportPlan> util = new ExcelUtil<UserSportPlan>(UserSportPlan.class);
        util.exportExcel(response, list, "用户运动计划数据");
    }

    /**
     * 获取用户运动计划详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:plan:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(userSportPlanService.selectUserSportPlanById(id));
    }

    /**
     * 新增用户运动计划
     */
    @PreAuthorize("@ss.hasPermi('system:plan:add')")
    @Log(title = "用户运动计划", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserSportPlan userSportPlan)
    {
        return toAjax(userSportPlanService.insertUserSportPlan(userSportPlan));
    }

    /**
     * 修改用户运动计划
     */
    @PreAuthorize("@ss.hasPermi('system:plan:edit')")
    @Log(title = "用户运动计划", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserSportPlan userSportPlan)
    {
        return toAjax(userSportPlanService.updateUserSportPlan(userSportPlan));
    }

    /**
     * 删除用户运动计划
     */
    @PreAuthorize("@ss.hasPermi('system:plan:remove')")
    @Log(title = "用户运动计划", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userSportPlanService.deleteUserSportPlanByIds(ids));
    }
}
