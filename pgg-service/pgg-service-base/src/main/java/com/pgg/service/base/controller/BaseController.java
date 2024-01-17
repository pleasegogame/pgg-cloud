package com.pgg.service.base.controller;

import com.pgg.platform.boot.common.base.Result;
import com.pgg.service.system.api.dto.ApiSystemDTO;
import com.pgg.service.system.api.feign.ISystemFeign;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Api(tags = "pgg-base")
@RestController
@RequestMapping(value = "base")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RefreshScope
public class BaseController {

    private final ISystemFeign systemFeign;

    @GetMapping(value = "api/by/id")
    @ApiOperation(value = "Fegin Get调用测试接口")
    public Result<Object> feginById(@RequestParam("id") Long id) {
        return Result.data(systemFeign.querySystemById(id));
    }

    @PostMapping(value = "api/by/dto")
    @ApiOperation(value = "Fegin Post调用测试接口")
    public Result<Object> feginByDto(@Valid @RequestBody ApiSystemDTO systemDTO) {
        return Result.data(systemFeign.querySystemByDto(systemDTO));
    }
}
