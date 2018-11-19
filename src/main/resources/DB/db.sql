CREATE DATABASE `mgmt_system_redis` CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';
USE `mgmt_system_redis`;

CREATE TABLE sys_area (
id BIGINT auto_increment COMMENT '编号' PRIMARY KEY,
parent_id BIGINT NOT NULL COMMENT '父级编号',
parent_ids VARCHAR ( 2000 ) NOT NULL COMMENT '所有父级编号',
NAME VARCHAR ( 100 ) NOT NULL COMMENT '名称',
sort DECIMAL NOT NULL COMMENT '排序',
CODE VARCHAR ( 100 ) NULL COMMENT '区域编码',
type CHAR NULL COMMENT '区域类型',
create_by VARCHAR ( 64 ) NOT NULL COMMENT '创建者',
create_date datetime NOT NULL COMMENT '创建时间',
update_by VARCHAR ( 64 ) NOT NULL COMMENT '更新者',
update_date datetime NOT NULL COMMENT '更新时间',
remarks VARCHAR ( 255 ) NULL COMMENT '备注信息',
del_flag CHAR DEFAULT '0' NOT NULL COMMENT '删除标记'
) COMMENT '区域表' COLLATE = utf8_bin;
CREATE INDEX sys_area_del_flag ON sys_area ( del_flag );
CREATE INDEX sys_area_parent_id ON sys_area ( parent_id );
CREATE TABLE sys_dict (
id BIGINT NULL,

VALUE
	TINYTEXT NULL,
	label TINYTEXT NULL,
	type TINYTEXT NULL,
	description TINYTEXT NULL,
	sort DECIMAL NULL,
	parent_id BIGINT NULL,
	create_by TINYTEXT NULL,
	create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ON UPDATE CURRENT_TIMESTAMP,
	update_by TINYTEXT NULL,
	update_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
	remarks VARCHAR ( 255 ) NULL,
	del_flag CHAR NULL
	) COMMENT '字典表';
CREATE TABLE sys_log (
	id BIGINT auto_increment COMMENT '编号' PRIMARY KEY,
	type CHAR DEFAULT '1' NULL COMMENT '日志类型',
	title VARCHAR ( 255 ) DEFAULT '' NULL COMMENT '日志标题',
	create_by VARCHAR ( 64 ) NULL COMMENT '创建者',
	create_date datetime NULL COMMENT '创建时间',
	remote_addr VARCHAR ( 255 ) NULL COMMENT '操作IP地址',
	user_agent VARCHAR ( 255 ) NULL COMMENT '用户代理',
	request_uri VARCHAR ( 255 ) NULL COMMENT '请求URI',
	method VARCHAR ( 5 ) NULL COMMENT '操作方式',
	params text NULL COMMENT '操作提交的数据',
	exception text NULL COMMENT '异常信息'
) COMMENT '日志表' COLLATE = utf8_bin;
CREATE INDEX sys_log_create_by ON sys_log ( create_by );
CREATE INDEX sys_log_create_date ON sys_log ( create_date );
CREATE INDEX sys_log_request_uri ON sys_log ( request_uri );
CREATE INDEX sys_log_type ON sys_log ( type );
CREATE TABLE sys_menu (
	id BIGINT auto_increment COMMENT '编号' PRIMARY KEY,
	parent_id BIGINT NOT NULL COMMENT '父级编号',
	parent_ids VARCHAR ( 2000 ) NOT NULL COMMENT '所有父级编号',
	NAME VARCHAR ( 100 ) NOT NULL COMMENT '名称',
	sort DECIMAL NOT NULL COMMENT '排序',
	href VARCHAR ( 2000 ) NULL COMMENT '链接',
	target VARCHAR ( 20 ) NULL COMMENT '目标',
	icon VARCHAR ( 100 ) NULL COMMENT '图标',
	is_show CHAR NOT NULL COMMENT '是否在菜单中显示',
	permission VARCHAR ( 200 ) NULL COMMENT '权限标识',
	create_by VARCHAR ( 64 ) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by VARCHAR ( 64 ) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks VARCHAR ( 255 ) NULL COMMENT '备注信息',
	del_flag CHAR DEFAULT '0' NOT NULL COMMENT '删除标记'
) COMMENT '菜单表' COLLATE = utf8_bin;
CREATE INDEX sys_menu_del_flag ON sys_menu ( del_flag );
CREATE INDEX sys_menu_parent_id ON sys_menu ( parent_id );
CREATE TABLE sys_office (
	id BIGINT auto_increment COMMENT '编号' PRIMARY KEY,
	parent_id BIGINT NOT NULL COMMENT '父级编号',
	parent_ids VARCHAR ( 2000 ) NOT NULL COMMENT '所有父级编号',
	NAME VARCHAR ( 100 ) NOT NULL COMMENT '名称',
	sort DECIMAL NOT NULL COMMENT '排序',
	area_id VARCHAR ( 64 ) NOT NULL COMMENT '归属区域',
	CODE VARCHAR ( 100 ) NULL COMMENT '区域编码',
	type CHAR NOT NULL COMMENT '机构类型',
	grade CHAR NOT NULL COMMENT '机构等级',
	address VARCHAR ( 255 ) NULL COMMENT '联系地址',
	zip_code VARCHAR ( 100 ) NULL COMMENT '邮政编码',
	MASTER VARCHAR ( 100 ) NULL COMMENT '负责人',
	phone VARCHAR ( 200 ) NULL COMMENT '电话',
	fax VARCHAR ( 200 ) NULL COMMENT '传真',
	email VARCHAR ( 200 ) NULL COMMENT '邮箱',
	USEABLE VARCHAR ( 64 ) NULL COMMENT '是否启用',
	PRIMARY_PERSON VARCHAR ( 64 ) NULL COMMENT '主负责人',
	DEPUTY_PERSON VARCHAR ( 64 ) NULL COMMENT '副负责人',
	create_by VARCHAR ( 64 ) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by VARCHAR ( 64 ) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks VARCHAR ( 255 ) NULL COMMENT '备注信息',
	del_flag CHAR DEFAULT '0' NOT NULL COMMENT '删除标记'
) COMMENT '机构表' COLLATE = utf8_bin;
CREATE INDEX sys_office_del_flag ON sys_office ( del_flag );
CREATE INDEX sys_office_parent_id ON sys_office ( parent_id );
CREATE INDEX sys_office_type ON sys_office ( type );
CREATE TABLE sys_role (
	id BIGINT auto_increment COMMENT '编号' PRIMARY KEY,
	office_id BIGINT NULL COMMENT '归属机构',
	NAME VARCHAR ( 100 ) NOT NULL COMMENT '角色名称',
	enname VARCHAR ( 255 ) NULL COMMENT '英文名称',
	role_type VARCHAR ( 255 ) NULL COMMENT '角色类型',
	data_scope CHAR NULL COMMENT '数据范围',
	is_sys VARCHAR ( 64 ) NULL COMMENT '是否系统数据',
	useable VARCHAR ( 64 ) NULL COMMENT '是否可用',
	create_by VARCHAR ( 64 ) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by VARCHAR ( 64 ) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks VARCHAR ( 255 ) NULL COMMENT '备注信息',
	del_flag CHAR DEFAULT '0' NOT NULL COMMENT '删除标记'
) COMMENT '角色表' COLLATE = utf8_bin;
CREATE INDEX sys_role_del_flag ON sys_role ( del_flag );
CREATE INDEX sys_role_enname ON sys_role ( enname );
CREATE TABLE sys_role_menu ( role_id BIGINT NOT NULL COMMENT '角色编号', menu_id BIGINT NOT NULL COMMENT '菜单编号', PRIMARY KEY ( role_id, menu_id ) ) COMMENT '角色-菜单' COLLATE = utf8_bin;
CREATE TABLE sys_role_office ( role_id BIGINT NOT NULL COMMENT '角色编号', office_id BIGINT NOT NULL COMMENT '机构编号', PRIMARY KEY ( role_id, office_id ) ) COMMENT '角色-机构' COLLATE = utf8_bin;
CREATE TABLE sys_user (
	id BIGINT auto_increment COMMENT '编号' PRIMARY KEY,
	company_id BIGINT NOT NULL COMMENT '归属公司',
	office_id BIGINT NOT NULL COMMENT '归属部门',
	login_name VARCHAR ( 100 ) NOT NULL COMMENT '登录名',
	PASSWORD VARCHAR ( 100 ) NOT NULL COMMENT '密码',
	NO VARCHAR ( 100 ) NULL COMMENT '工号',
	NAME VARCHAR ( 100 ) NOT NULL COMMENT '姓名',
	email VARCHAR ( 200 ) NULL COMMENT '邮箱',
	phone VARCHAR ( 200 ) NULL COMMENT '电话',
	mobile VARCHAR ( 200 ) NULL COMMENT '手机',
	user_type CHAR NULL COMMENT '用户类型',
	photo VARCHAR ( 1000 ) NULL COMMENT '用户头像',
	login_ip VARCHAR ( 100 ) NULL COMMENT '最后登陆IP',
	login_date datetime NULL COMMENT '最后登陆时间',
	login_flag VARCHAR ( 64 ) NULL COMMENT '是否可登录',
	create_by VARCHAR ( 64 ) NOT NULL COMMENT '创建者',
	create_date datetime NOT NULL COMMENT '创建时间',
	update_by VARCHAR ( 64 ) NOT NULL COMMENT '更新者',
	update_date datetime NOT NULL COMMENT '更新时间',
	remarks VARCHAR ( 255 ) NULL COMMENT '备注信息',
	del_flag CHAR DEFAULT '0' NOT NULL COMMENT '删除标记'
) COMMENT '用户表' COLLATE = utf8_bin;
CREATE INDEX sys_user_company_id ON sys_user ( company_id );
CREATE INDEX sys_user_del_flag ON sys_user ( del_flag );
CREATE INDEX sys_user_login_name ON sys_user ( login_name );
CREATE INDEX sys_user_office_id ON sys_user ( office_id );
CREATE INDEX sys_user_update_date ON sys_user ( update_date );
CREATE TABLE sys_user_role ( user_id BIGINT NOT NULL COMMENT '用户编号', role_id BIGINT NOT NULL COMMENT '角色编号', PRIMARY KEY ( user_id, role_id ) ) COMMENT '用户-角色' COLLATE = utf8_bin;
CREATE TABLE
IF
	NOT EXISTS redis_cluster (
		id BIGINT auto_increment COMMENT '编号' PRIMARY KEY,
		redis_host_name VARCHAR ( 100 ) NOT NULL COMMENT 'redis主机名',
		redis_port INT ( 20 ) NULL COMMENT 'redis端口',
		create_by VARCHAR ( 64 ) NOT NULL COMMENT '创建者',
		create_date datetime NOT NULL COMMENT '创建时间',
		update_by VARCHAR ( 64 ) NOT NULL COMMENT '更新者',
		update_date datetime NOT NULL COMMENT '更新时间',
		remarks VARCHAR ( 255 ) NULL COMMENT '备注信息',
		del_flag CHAR DEFAULT '0' NOT NULL COMMENT '删除标记'
	) COMMENT 'redis集群信息' COLLATE = utf8_bin;
INSERT INTO `mgmt_system_redis`.redis_cluster ( id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 1, '127.0.0.1', 7000, '1', '2018-11-14 20:23:58', '1', '2018-11-14 20:23:58', '', '0' );
INSERT INTO `mgmt_system_redis`.redis_cluster ( id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 2, '127.0.0.1', 7001, '1', '2018-11-14 20:23:59', '1', '2018-11-14 20:24:09', '', '0' );
INSERT INTO `mgmt_system_redis`.redis_cluster ( id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 3, '127.0.0.1', 7002, '1', '2018-11-14 20:24:16', '1', '2018-11-14 20:24:16', '', '0' );
INSERT INTO `mgmt_system_redis`.redis_cluster ( id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 4, '127.0.0.1', 7003, '1', '2018-11-14 20:24:22', '1', '2018-11-14 20:24:22', '', '0' );
INSERT INTO `mgmt_system_redis`.redis_cluster ( id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 5, '127.0.0.1', 7004, '1', '2018-11-14 20:24:28', '1', '2018-11-14 20:24:28', '', '0' );
INSERT INTO `mgmt_system_redis`.redis_cluster ( id, redis_host_name, redis_port, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 6, '127.0.0.1', 7005, '1', '2018-11-14 20:24:33', '1', '2018-11-14 20:24:33', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_area ( id, parent_id, parent_ids, NAME, sort, CODE, type, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 1, 0, '0,', '中国', 10, '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_area ( id, parent_id, parent_ids, NAME, sort, CODE, type, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 2, 1, '0,1,', '北京', 20, '110000', '2', '1', '2013-05-27 08:00:00', '1', '2018-10-11 14:23:48', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_area ( id, parent_id, parent_ids, NAME, sort, CODE, type, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 3, 2, '0,1,2,', '北京市', 30, '110101', '3', '1', '2013-05-27 08:00:00', '1', '2018-10-11 17:34:38', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_area ( id, parent_id, parent_ids, NAME, sort, CODE, type, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 4, 3, '0,1,2,3,', '海淀区', 40, '110102', '4', '1', '2013-05-27 08:00:00', '1', '2018-10-15 21:10:41', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_area ( id, parent_id, parent_ids, NAME, sort, CODE, type, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 5, 3, '0,1,2,3,', '东城区', 30, '100005', '4', '1', '2018-10-11 17:36:40', '1', '2018-10-11 18:04:41', '', '1' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 1, '0', '正常', 'del_flag', '删除标记', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 2, '1', '删除', 'del_flag', '删除标记', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 3, '1', '显示', 'show_hide', '显示/隐藏', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 4, '0', '隐藏', 'show_hide', '显示/隐藏', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 5, '1', '是', 'yes_no', '是/否', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 6, '0', '否', 'yes_no', '是/否', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 7, 'red', '红色', 'color', '颜色值', 10, 0, '1', '2013-05-27 08:00:00', '1', '2018-10-15 21:11:08', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 8, 'green', '绿色', 'color', '颜色值', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 9, 'blue', '蓝色', 'color', '颜色值', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 10, 'yellow', '黄色', 'color', '颜色值', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 11, 'orange', '橙色', 'color', '颜色值', 50, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 12, 'default', '默认主题', 'theme', '主题方案', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 13, 'cerulean', '天蓝主题', 'theme', '主题方案', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 14, 'readable', '橙色主题', 'theme', '主题方案', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 15, 'united', '红色主题', 'theme', '主题方案', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 16, 'flat', 'Flat主题', 'theme', '主题方案', 60, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 17, '1', '国家', 'sys_area_type', '区域类型', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 18, '2', '省份、直辖市', 'sys_area_type', '区域类型', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 19, '3', '地市', 'sys_area_type', '区域类型', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 20, '4', '区县', 'sys_area_type', '区域类型', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 21, '1', '公司', 'sys_office_type', '机构类型', 60, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 22, '2', '部门', 'sys_office_type', '机构类型', 70, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 23, '3', '小组', 'sys_office_type', '机构类型', 80, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 24, '4', '其它', 'sys_office_type', '机构类型', 90, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 25, '1', '综合部', 'sys_office_common', '快捷通用部门', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 26, '2', '开发部', 'sys_office_common', '快捷通用部门', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 27, '3', '人力部', 'sys_office_common', '快捷通用部门', 50, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 28, '1', '一级', 'sys_office_grade', '机构等级', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 29, '2', '二级', 'sys_office_grade', '机构等级', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 30, '3', '三级', 'sys_office_grade', '机构等级', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 31, '4', '四级', 'sys_office_grade', '机构等级', 40, 0, '1', '2013-05-27 08:00:00', '1', '2018-10-11 18:49:44', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 32, '1', '所有数据', 'sys_data_scope', '数据范围', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 33, '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', 20, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 34, '3', '所在公司数据', 'sys_data_scope', '数据范围', 30, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 35, '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', 40, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 36, '5', '所在部门数据', 'sys_data_scope', '数据范围', 50, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 37, '8', '仅本人数据', 'sys_data_scope', '数据范围', 90, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 38, '9', '按明细设置', 'sys_data_scope', '数据范围', 100, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 39, '1', '系统管理', 'sys_user_type', '用户类型', 10, 0, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 41, '2', '普通用户', 'sys_user_type', '用户类型', 30, 0, '1', '2013-05-27 08:00:00', '1', '2018-10-11 15:05:47', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 67, '1', '接入日志', 'sys_log_type', '日志类型', 30, 0, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 68, '2', '异常日志', 'sys_log_type', '日志类型', 40, 0, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 96, '1', '男', 'sex', '性别', 10, 0, '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 97, '2', '女', 'sex', '性别', 20, 0, '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', NULL, '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 139, 'string', 'string', 'redis_data_type', 'String类型', 10, 0, '1', '2018-10-29 15:13:42', '1', '2018-10-29 15:14:56', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 140, 'list', 'list', 'redis_data_type', 'List类型', 20, 0, '1', '2018-10-29 15:13:53', '1', '2018-10-29 15:15:05', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 141, 'set', 'set', 'redis_data_type', 'Set类型', 30, 0, '1', '2018-10-29 15:14:06', '1', '2018-10-29 15:15:21', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 142, 'zset', 'zset', 'redis_data_type', 'ZSet类型', 40, 0, '1', '2018-10-29 15:14:27', '1', '2018-10-29 15:15:13', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 143, 'hash', 'hash', 'redis_data_type', 'Hash类型', 50, 0, '1', '2018-10-29 15:14:50', '1', '2018-10-29 15:14:50', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 144, '0', '右侧(尾部)', 'redis_list_from_left', 'redis缓存list是否从左侧添加', 10, 0, '1', '2018-10-30 17:08:58', '1', '2018-11-03 10:32:54', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_dict ( id, VALUE, label, type, description, sort, parent_id, create_by, create_date, update_by, update_date, remarks, del_flag )
VALUES
	( 146, '1', '左侧(头部)', 'redis_list_from_left', 'redis缓存list是否从左侧添加', 20, 0, '1', '2018-10-30 17:11:12', '1', '2018-11-03 10:32:41', '', '0' );
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		1,
		0,
		'0,',
		'功能菜单',
		0,
		NULL,
		NULL,
		NULL,
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		2,
		1,
		'0,1,',
		'系统设置',
		10,
		NULL,
		NULL,
		NULL,
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		3,
		2,
		'0,1,2,',
		'系统设置',
		40,
		NULL,
		NULL,
		NULL,
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		4,
		3,
		'0,1,2,3,',
		'菜单管理',
		30,
		'/sys/menu/',
		'',
		'list-alt',
		'1',
		'',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2018-10-15 14:39:45',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		5,
		4,
		'0,1,2,3,4,',
		'查看',
		30,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:menu:view',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		6,
		4,
		'0,1,2,3,4,',
		'修改',
		40,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:menu:edit',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		7,
		3,
		'0,1,2,3,',
		'角色管理',
		50,
		'/sys/role/',
		NULL,
		'lock',
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		8,
		7,
		'0,1,2,3,7,',
		'查看',
		30,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:role:view',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		9,
		7,
		'0,1,2,3,7,',
		'修改',
		40,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:role:edit',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		10,
		3,
		'0,1,2,3,',
		'字典管理',
		60,
		'/sys/dict/',
		NULL,
		'th-list',
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		11,
		10,
		'0,1,2,3,10,',
		'查看',
		30,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:dict:view',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		12,
		10,
		'0,1,2,3,10,',
		'修改',
		40,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:dict:edit',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		13,
		2,
		'0,1,2,',
		'机构用户',
		30,
		NULL,
		NULL,
		NULL,
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		14,
		13,
		'0,1,2,13,',
		'区域管理',
		50,
		'/sys/area/',
		NULL,
		'th',
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		15,
		14,
		'0,1,2,13,14,',
		'查看',
		30,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:area:view',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		16,
		14,
		'0,1,2,13,14,',
		'修改',
		40,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:area:edit',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		17,
		13,
		'0,1,2,13,',
		'机构管理',
		40,
		'/sys/office/',
		NULL,
		'th-large',
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		18,
		17,
		'0,1,2,13,17,',
		'查看',
		30,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:office:view',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		19,
		17,
		'0,1,2,13,17,',
		'修改',
		40,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:office:edit',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		20,
		13,
		'0,1,2,13,',
		'用户管理',
		30,
		'/sys/user/index',
		'',
		'user',
		'1',
		'',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2018-10-11 18:04:51',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		21,
		20,
		'0,1,2,13,20,',
		'查看',
		30,
		'',
		'',
		'',
		'0',
		'sys:user:view',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2018-10-07 19:35:28',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		22,
		20,
		'0,1,2,13,20,',
		'修改',
		40,
		NULL,
		NULL,
		NULL,
		'0',
		'sys:user:edit',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		27,
		2,
		'0,1,2,',
		'我的面板',
		20,
		'',
		'',
		'',
		'0',
		'',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2018-10-11 16:17:24',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		28,
		27,
		'0,1,2,27,',
		'个人信息',
		30,
		'',
		'',
		'',
		'1',
		'',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2018-10-11 18:49:24',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		29,
		28,
		'0,1,2,27,28,',
		'个人信息',
		30,
		'/sys/user/info',
		NULL,
		'user',
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		30,
		28,
		'0,1,2,27,28,',
		'修改密码',
		40,
		'/sys/user/modifyPwd',
		NULL,
		'lock',
		'1',
		NULL,
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		57,
		56,
		'0,1,2,27,40,56,',
		'查看',
		30,
		NULL,
		NULL,
		NULL,
		'0',
		'cms:ckfinder:view',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		58,
		56,
		'0,1,2,27,40,56,',
		'上传',
		40,
		NULL,
		NULL,
		NULL,
		'0',
		'cms:ckfinder:upload',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		59,
		56,
		'0,1,2,27,40,56,',
		'修改',
		50,
		NULL,
		NULL,
		NULL,
		'0',
		'cms:ckfinder:edit',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2013-05-27 08:00:00',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		80,
		2,
		'0,1,2,',
		'开发工具',
		10,
		'',
		'',
		'',
		'1',
		'',
		'1',
		'2013-10-16 08:00:00',
		'1',
		'2018-10-16 09:56:09',
		'仅供研发人员使用！',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		149,
		80,
		'0,1,2,80,',
		'缓存管理',
		10,
		'/redis/sysRedis',
		'',
		'',
		'1',
		'',
		'1',
		'2018-10-20 16:40:30',
		'1',
		'2018-10-20 17:46:09',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		150,
		149,
		'0,1,2,80,149,',
		'查看',
		30,
		NULL,
		NULL,
		NULL,
		'0',
		'redis:sysRedis:view',
		'1',
		'2018-10-20 16:40:30',
		'1',
		'2018-10-20 16:40:30',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		151,
		149,
		'0,1,2,80,149,',
		'修改',
		30,
		NULL,
		NULL,
		NULL,
		'0',
		'redis:sysRedis:edit',
		'1',
		'2018-10-20 16:40:30',
		'1',
		'2018-10-20 16:40:30',
		NULL,
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		160,
		80,
		'0,1,2,80,',
		'集群配置',
		40,
		'/redis/redisCluster',
		'',
		'',
		'1',
		'',
		'1',
		'2018-11-14 20:21:33',
		'1',
		'2018-11-14 20:21:43',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		161,
		160,
		'0,1,2,80,160,',
		'查看',
		30,
		'',
		'',
		'',
		'0',
		'redis:redisCluster:view',
		'1',
		'2018-11-14 20:22:13',
		'1',
		'2018-11-14 20:22:13',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_menu (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	href,
	target,
	icon,
	is_show,
	permission,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		162,
		160,
		'0,1,2,80,160,',
		'修改',
		60,
		'',
		'',
		'',
		'0',
		'redis:redisCluster:edit',
		'1',
		'2018-11-14 20:22:29',
		'1',
		'2018-11-14 20:22:29',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_office (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	area_id,
	CODE,
	type,
	grade,
	address,
	zip_code,
	MASTER,
	phone,
	fax,
	email,
	USEABLE,
	PRIMARY_PERSON,
	DEPUTY_PERSON,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		1,
		0,
		'0,',
		'总部',
		10,
		'2',
		'100000',
		'1',
		'1',
		'',
		'',
		'',
		'',
		'',
		'',
		'1',
		'',
		'',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2018-11-14 20:43:56',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_office (
	id,
	parent_id,
	parent_ids,
	NAME,
	sort,
	area_id,
	CODE,
	type,
	grade,
	address,
	zip_code,
	MASTER,
	phone,
	fax,
	email,
	USEABLE,
	PRIMARY_PERSON,
	DEPUTY_PERSON,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		2,
		1,
		'0,1,',
		'研发部',
		30,
		'4',
		'100000001',
		'2',
		'1',
		'',
		'',
		'',
		'',
		'',
		'',
		'1',
		'',
		'',
		'1',
		'2018-10-11 14:23:13',
		'1',
		'2018-11-14 20:44:08',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 1 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 2 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 3 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 4 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 5 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 6 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 7 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 8 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 9 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 10 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 11 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 12 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 13 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 14 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 15 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 16 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 17 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 18 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 19 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 20 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 21 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 22 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 27 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 28 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 29 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 30 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 57 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 58 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 59 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 80 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 149 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 150 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 151 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 160 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 161 );
INSERT INTO `mgmt_system_redis`.sys_role_menu ( role_id, menu_id )
VALUES
	( 1, 162 );
INSERT INTO `mgmt_system_redis`.sys_role_office ( role_id, office_id )
VALUES
	( 1, 1 );
INSERT INTO `mgmt_system_redis`.sys_role (
	id,
	office_id,
	NAME,
	enname,
	role_type,
	data_scope,
	is_sys,
	useable,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		1,
		2,
		'系统管理员',
		'dept',
		'assignment',
		'1',
		'1',
		'1',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2018-11-14 20:22:39',
		'',
		'0'
	);
INSERT INTO `mgmt_system_redis`.sys_user_role ( user_id, role_id )
VALUES
	( 1, 1 );
INSERT INTO `mgmt_system_redis`.sys_user (
	id,
	company_id,
	office_id,
	login_name,
	PASSWORD,
	NO,
	NAME,
	email,
	phone,
	mobile,
	user_type,
	photo,
	login_ip,
	login_date,
	login_flag,
	create_by,
	create_date,
	update_by,
	update_date,
	remarks,
	del_flag
)
VALUES
	(
		1,
		1,
		2,
		'admin',
		'a5eaa537ee49eeb81ddeb7b4d327f98fcef83943b0cd442f06b6e3a2',
		'0001',
		'系统管理员',
		'xbs1019@126.com',
		'17610639158',
		'17610639158',
		'1',
		'/userfiles/1/images/photo/2018/10/05de1b07.jpeg',
		'0:0:0:0:0:0:0:1',
		'2018-11-14 20:48:26',
		'1',
		'1',
		'2013-05-27 08:00:00',
		'1',
		'2018-11-14 20:44:32',
		'最高管理员',
	'0'
);