
欢迎使用 api_manager_aspnmy v1.1_new
[修改说明]
	修改了原版本中的密码认证方式为：MD5($login_name.$_VAL['login_pwd']);
	$_VAL = I($_POST);
        $login_name = session('login_name');
        $ord_pwd = md5($login_name.$_VAL['ord_pwd']);//md5($_VAL['ord_pwd']);
        $new_pwd = md5($login_name.$_VAL['new_pwd']);//md5($_VAL['new_pwd']);
        $new_pwd2 = md5($login_name.$_VAL['new_pwd2']);//md5($_VAL['new_pwd2']);
        主要修改 /MinPHP/run/modpwd.php 7~11行
        次要修改 /MinPHP/run/login.php 9行
        初始数据库请用 api_manager.sql

[安装步骤]
	第一步:	新建数据库导入 api_manager.sql
	第二步:	修改./MinPHP/core/config.php 数据库配置段
	第三步:	愉快的使用ing

[注]
	1)此版本为v1.1_new版本，权限控制。仅有超级管理员权限
	2)”游客”,只能查看接口分类，与接口信息(无增删改查权限)
	3)此版本默认的管理员有两个分别为admin(密码:admin)与root(密码:root)。帐号可以手动修改user数据表
	4)会在v1.1_new基础上增加团队权限,如需修改请保留api_manager_aspnmy v1.1_new 即可

[修改者]
	email:	aspnmy@aodao.com.cn

//以下为原作者版本说明
欢迎使用 接口管理工具v1.1

[安装步骤]
	第一步:	新建数据库导入 db.sql
	第二步:	修改./MinPHP/core/config.php 数据库配置段
	第三步:	愉快的使用ing

[注]
	1)此版本为v1.0版本，权限控制。仅有超级管理员权限
	2)”游客”,只能查看接口分类，与接口信息(无增删改查权限)
	3)此版本默认的管理员有两个分别为admin(密码:654321)与root(密码:123456)。帐号可以手动修改user数据表

[原作者]
	email:	gongcoder@gmail.com
	qq:	309581329

