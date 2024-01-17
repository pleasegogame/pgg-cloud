package com.pgg.service.system.controller;

import com.pgg.platform.boot.common.base.Result;
import com.pgg.service.system.dto.SystemDTO;
import com.pgg.service.system.service.ISystemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Api(tags = "pgg-system")
@RestController
@RequestMapping(value = "system")
@AllArgsConstructor
public class SystemController {

    private final ISystemService systemService;

    @ApiOperation(value = "system list接口")
    @GetMapping(value = "list")
    public Object list() {
        return systemService.list();
    }

    @ApiOperation(value = "system page接口")
    @GetMapping(value = "page")
    public Object page() {
        return systemService.page();
    }

    @GetMapping(value = "exception")
    @ApiOperation(value = "自定义异常及返回测试接口")
    public Result<String> exception() {
        return Result.data(systemService.exception(), null);
    }

    @PostMapping(value = "valid")
    @ApiOperation(value = "参数校验测试接口")
    public Result<SystemDTO> valid(@Valid @RequestBody SystemDTO systemDTO) {
        return Result.data(systemDTO);
    }
}
