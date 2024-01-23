package com.pgg.service.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.pgg.service.system.dto.QueryUserDTO;
import com.pgg.service.system.entity.User;

import java.util.List;

/**
 * @ClassName: IUserService
 * @Description: 用户相关操接口
 */
public interface IUserService extends IService<User> {

    List<User> testList(QueryUserDTO user);


}
