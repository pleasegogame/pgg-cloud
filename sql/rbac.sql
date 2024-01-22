CREATE TABLE `t_sys_user`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
    `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
    `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
    `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '1 : 男，0 : 女',
    `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
    `mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
    `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
    `status` tinyint(1) NULL DEFAULT 1 COMMENT '\'0\'禁用，\'1\' 启用, \'2\' 密码过期或初次未修改',
    `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
    `country` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
    `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
    `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
    `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
    `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道详细地址',
    `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
    `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '1:删除 0:不删除',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `INDEX_USER_NAME`(`real_name`) USING BTREE,
    INDEX `INDEX_USER_PHONE`(`mobile`) USING BTREE,
    INDEX `INDEX_USER_EMAIL`(`email`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

CREATE TABLE `t_sys_role`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父id',
    `role_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
    `role_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
    `role_level` int(11) NULL DEFAULT NULL COMMENT '角色级别',
    `role_status` tinyint(1) NULL DEFAULT 1 COMMENT '1有效，0禁用',
    `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
    `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '1:删除 0:不删除',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `INDEX_ROLE_NAME`(`role_name`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

CREATE TABLE `t_sys_user_role`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `user_id` bigint(20) NOT NULL COMMENT '用户id',
    `role_id` bigint(20) NOT NULL COMMENT '角色id',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
    `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '1:删除 0:不删除',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `INDEX_USER_ID`(`user_id`) USING BTREE,
    INDEX `INDEX_ROLE_ID`(`role_id`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;


CREATE TABLE `t_sys_resource`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父id',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `ancestors` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有上级组织id的集合，便于机构查找',
    `resource_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
    `resource_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源标识',
    `resource_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源类型 1、模块 2、菜单 3、按钮 4、链接',
    `resource_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源图标',
    `resource_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源路径',
    `resource_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资料链接',
    `resource_level` int(11) NULL DEFAULT NULL COMMENT '资源级别',
    `resource_show` tinyint(1) NULL DEFAULT NULL COMMENT '是否显示',
    `resource_cache` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存',
    `resource_page_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源页面名称',
    `resource_status` tinyint(1) NULL DEFAULT 1 COMMENT '1有效，0禁用',
    `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
    `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:删除 0:不删除',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `INDEX_PERM_NAME`(`resource_name`) USING BTREE,
    INDEX `INDEX_PERM_PID`(`parent_id`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

CREATE TABLE `t_sys_role_resource`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `role_id` bigint(20) NOT NULL COMMENT '角色id',
    `resource_id` bigint(20) NOT NULL COMMENT '资源id',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
    `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1:删除 0:不删除',
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和权限关联表' ROW_FORMAT = Dynamic;


CREATE TABLE `t_sys_organization`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父组织id',
    `ancestors` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所有上级组织id的集合，便于机构查找',
    `organization_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织类型：1：事业部  2：机构  3：盐城',
    `organization_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织名称',
    `organization_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织编码',
    `organization_icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织图标',
    `organization_level` int(11) NULL DEFAULT NULL COMMENT '组织级别（排序）',
    `organization_status` tinyint(1) NULL DEFAULT 1 COMMENT '1有效，0禁用',
    `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
    `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
    `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
    `street` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道',
    `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
    `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '1:删除 0:不删除',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `INDEX_ORG_NAME`(`organization_name`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织表' ROW_FORMAT = Dynamic;

CREATE TABLE `t_sys_organization_user`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `organization_id` bigint(20) NOT NULL COMMENT '机构id',
    `user_id` bigint(20) NOT NULL COMMENT '用户id',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
    `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '1:删除 0:不删除',
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- 权限扩展表：
-- 1、机构角色表：t_sys_organization_role(某机构下所有人员都具有某种角色的权限)
CREATE TABLE `t_sys_organization_role`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `organization_id` bigint(20) NOT NULL COMMENT '组织机构id',
    `role_id` bigint(20) NOT NULL COMMENT '角色id',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
    `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '1:删除 0:不删除',
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '可以给组织权限，在该组织下的所有用户都有此权限' ROW_FORMAT = Dynamic;

-- 2、数据权限配置表：t_sys_data_permission
CREATE TABLE `t_sys_data_permission`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `user_id` bigint(20) NOT NULL COMMENT '用户id',
    `organization_id` bigint(20) NOT NULL COMMENT '机构id',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建者',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '更新者',
    `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '1:删除 0:不删除',
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- 3、用户信息扩展表：t_sys_user_info 这个根据自己业务具体需求进行扩展
CREATE TABLE `t_sys_user_info`  (
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tenant_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '租户id',
    `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '上级ID',
    `user_id` bigint(20) NULL DEFAULT NULL COMMENT '系统用户表用户ID',
    `wechat_open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '小程序用户openid',
    `wechat_platform_open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '公众号用户openid',
    `wechat_union_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微信用户union id',
    `telephone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '固定电话',
    `wechat_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
    `qq_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
    `user_type` smallint(1) NULL DEFAULT 1 COMMENT '用户类型1、普通用户',
    `member_points` bigint(20) NULL DEFAULT 60 COMMENT '会员积分',
    `work_unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作单位',
    `duties` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务',
    `education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
    `card_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件类型',
    `card_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件号码',
    `card_front` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正面照片',
    `card_reverse` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反面照片',
    `graduated` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
    `gender` int(1) NULL DEFAULT NULL COMMENT '性别',
    `birthday` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
    `graduated_date` date NULL DEFAULT NULL COMMENT '毕业时间',
    `register_time` datetime(0) NULL DEFAULT NULL COMMENT '注册日期',
    `register_ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册ip',
    `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录日期',
    `last_login_ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登录ip',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `creator` bigint(20) NULL DEFAULT NULL COMMENT '创建人',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
    `operator` bigint(20) NULL DEFAULT NULL COMMENT '最后修改人',
    `del_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信注册会员表' ROW_FORMAT = DYNAMIC;
