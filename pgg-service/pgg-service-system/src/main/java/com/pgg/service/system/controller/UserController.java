package com.pgg.service.system.controller;

import com.pgg.platform.boot.common.base.Result;
import com.pgg.service.system.dto.QueryUserDTO;
import com.pgg.service.system.entity.User;
import com.pgg.service.system.service.IUserService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;

/**
 * @ClassName: UserController
 * @Description: User前端控制器
 */
@Slf4j
@RestController
@RequestMapping(value = "user")
@RequiredArgsConstructor(onConstructor_ = @Autowired)
@Api(value = "UserController|用户相关的前端控制器", tags = {"用户配置"})
@RefreshScope
public class UserController {

    private final IUserService userService;

    @GetMapping("/testList")
    public Result<List<User>> testList(@ApiIgnore QueryUserDTO user) {
        List<User> list = userService.testList(user);
        return Result.data(list);
    }
}
