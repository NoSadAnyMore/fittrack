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
import com.nofantasy.project.system.domain.UserJfProRecord;
import com.nofantasy.project.system.service.IUserJfProRecordService;
import com.nofantasy.framework.web.controller.BaseController;
import com.nofantasy.framework.web.domain.AjaxResult;
import com.nofantasy.common.utils.poi.ExcelUtil;
import com.nofantasy.framework.web.page.TableDataInfo;

/**
 * 用户积分兑换记录Controller
 * 
 * @author nofantasy
 * @date 2024-12-21
 */
@RestController
@RequestMapping("/system/jfProRecord")
public class UserJfProRecordController extends BaseController
{
    @Autowired
    private IUserJfProRecordService userJfProRecordService;

    /**
     * 查询用户积分兑换记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserJfProRecord userJfProRecord)
    {
        startPage();
        List<UserJfProRecord> list = userJfProRecordService.selectUserJfProRecordList(userJfProRecord);
        return getDataTable(list);
    }

    /**
     * 导出用户积分兑换记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:record:export')")
    @Log(title = "用户积分兑换记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserJfProRecord userJfProRecord)
    {
        List<UserJfProRecord> list = userJfProRecordService.selectUserJfProRecordList(userJfProRecord);
        ExcelUtil<UserJfProRecord> util = new ExcelUtil<UserJfProRecord>(UserJfProRecord.class);
        util.exportExcel(response, list, "用户积分兑换记录数据");
    }

    /**
     * 获取用户积分兑换记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:record:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(userJfProRecordService.selectUserJfProRecordById(id));
    }

    /**
     * 新增用户积分兑换记录
     */
    @PreAuthorize("@ss.hasPermi('system:record:add')")
    @Log(title = "用户积分兑换记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserJfProRecord userJfProRecord)
    {
        return toAjax(userJfProRecordService.insertUserJfProRecord(userJfProRecord));
    }

    /**
     * 修改用户积分兑换记录
     */
    @PreAuthorize("@ss.hasPermi('system:record:edit')")
    @Log(title = "用户积分兑换记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserJfProRecord userJfProRecord)
    {
        return toAjax(userJfProRecordService.updateUserJfProRecord(userJfProRecord));
    }

    /**
     * 删除用户积分兑换记录
     */
    @PreAuthorize("@ss.hasPermi('system:record:remove')")
    @Log(title = "用户积分兑换记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userJfProRecordService.deleteUserJfProRecordByIds(ids));
    }
}
