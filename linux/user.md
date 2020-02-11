# 索引
* **用户**
    * [**增**](#user-content-增加用户-顶部)
    * [**删**](#user-content-删除用户-顶部)
    * [**查**](#user-content-查看用户-顶部)
    * [**改**](#user-content-修改用户-顶部)
* **组**
    * [**增**](#user-content-增加组-顶部)
    * [**删**](#user-content-删除组-顶部)
    * [**查**](#user-content-查看组-顶部)
    * [**改**](#user-content-修改组-顶部)
* [**初始配置文件**](#user-content-初始配置文件-顶部)

******************************************************************************

* root的UID一定为0, 被分配的UID范围在500\~4294967295之间

### 增加用户 [`顶部`](#user-content-索引)
* [**useradd**](command.md/#user-content-useradd-顶部)

### 删除用户 [`顶部`](#user-content-索引)
* [**userdel**](command.md/#user-content-userdel-顶部)

### 查看用户 [`顶部`](#user-content-索引)
* [**finger**](command.md/#user-content-finger-顶部) 查看用户详细信息
* [**id**](command.md/#user-content-id-顶部) 显示用户的UID与所属组 
<br>

* **`/etc/passwd`** 用户信息
```
用户名 : 密码占位符  : 用户id  : 组群id : 用户实名 : 主目录 : shell方式
root  : x          : 0      : 0      : root   : /root : /bin/bash
```
* **`/etc/shadow`** 用户密码
```
root:!:18056:0:99999:7:::
daemon:*:17937:0:99999:7:::
bin:*:17937:0:99999:7:::
用户名 
加密的密码 
上次修改密码的时间 
密码的最短有效天数, 默认值为0
密码的最长有效天数, 默认值为99999
提前多少天警告用户口令将过期, 默认值为7
在密码过期之后多少天禁用此用户
帐号失效时间, 默认值为空
保留字段(未使用)
```

### 修改用户 [`顶部`](#user-content-索引)
* [**usermod**](command.md/#user-content-usermod-顶部)
* [**passwd**](command.md/#user-content-passwd-顶部)

### 增加组 [`顶部`](#user-content-索引)
* [**groupadd**](command.md/#user-content-groupadd-顶部)

### 删除组 [`顶部`](#user-content-索引)
* [**groupdel**](command.md/#user-content-groupdel-顶部)

### 查看组 [`顶部`](#user-content-索引)
* **`/etc/group`** 组群信息
```
ypl : x : 0 : ypl
组群名 : 密码 : 组群id : 组群成员列表
```
* **`/etc/ gshadow`** 组群密码

### 修改组 [`顶部`](#user-content-索引)
* [**groupmod**](command.md/#user-content-groupmod-顶部)
* [**gpasswd**](command.md/#user-content-gpasswd-顶部) 添加或删除组员

### 初始配置文件 [`顶部`](#user-content-索引)
用户配置文件:
* **`~/.bash_profile`** 用户每次登录时执行
* **`~/.bashrc`** 每次进入新的Bash环境时执行
* **`~/.bash_logout`** 用户每次退出登录时执行  
  
全局配置文件:
* **`/etc/bashrc`**
* **`/erc/profile`**
