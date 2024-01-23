package com.pgg.service.system.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pgg.service.system.dto.QueryUserDTO;
import com.pgg.service.system.entity.User;
import com.pgg.service.system.mapper.UserMapper;
import com.pgg.service.system.service.IUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * @ClassName: UserServiceImpl
 * @Description: 用户相关操作接口实现类
 */
@Slf4j
@Service
@RequiredArgsConstructor(onConstructor_ = @Autowired)
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    private final UserMapper userMapper;

    @Override
    public List<User> testList(QueryUserDTO user) {
        List<User> users = userMapper.selectList(Wrappers.lambdaQuery(User.class).eq(User::getId, "1"));
        return users;
    }
}
