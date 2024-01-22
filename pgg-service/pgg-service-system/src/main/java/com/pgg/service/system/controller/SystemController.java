package com.pgg.service.system.controller;

import com.pgg.platform.boot.common.base.Result;
import com.pgg.service.system.dto.SystemDTO;
import com.pgg.service.system.service.ISystemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RMap;
import org.redisson.api.RedissonClient;
import org.redisson.client.codec.StringCodec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.data.redis.core.BoundHashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Api(tags = "pgg-system")
@RestController
@RequestMapping(value = "system")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@RefreshScope
public class SystemController {

    private final ISystemService systemService;

    private final RedissonClient redisson;

    private final RedisTemplate<String, String> template;

    @Value("${spring.datasource.maxActive}")
    private String nacosMaxActiveType;

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

    @PostMapping(value = "nacos")
    @ApiOperation(value = "Nacos读取配置文件测试接口")
    public Result<String> nacos() {
        return Result.data(nacosMaxActiveType);
    }

    @GetMapping(value = "api/by/id")
    @ApiOperation(value = "Fegin Get调用测试接口")
    public Result<Object> feginById(@RequestParam("id") String id) {
        return Result.data(systemService.list());
    }

    @PostMapping(value = "api/by/dto")
    @ApiOperation(value = "Fegin Post调用测试接口")
    public Result<Object> feginByDto(@Valid @RequestBody SystemDTO systemDTO) {
        return Result.data(systemDTO);
    }

    @ApiOperation(value = "限流测试")
    @GetMapping(value = "sentinel/protected")
    public Result<String> sentinelProtected() {
        return Result.data("访问的是限流测试接口");
    }

    @ApiOperation(value = "Gateway路由转发测试")
    @GetMapping(value = "gateway/forward")
    public Result gatewayForward() {
        return Result.success("gitegg-service-system测试数据");
    }

    @ApiOperation(value = "缓存测试设置值")
    @GetMapping(value = "redis/set")
    public Result redisSet(@RequestParam("id") String id) {
        RMap<String, String> m = redisson.getMap("test", StringCodec.INSTANCE);
        m.put("id", id);
        return Result.success("设置成功");
    }

    @ApiOperation(value = "缓存测试获取值")
    @GetMapping(value = "redis/get")
    public Result redisGet() {
        BoundHashOperations<String, String, String> hash = template.boundHashOps("test");
        String t = hash.get("id");
        return Result.success(t);
    }
}