# 目录
- [用户](#用户)
    - [/etc/passwd](#etcpasswd)
    - [/etc/shadow](#etcshadow)
    - [增加用户](#增加用户)
    - [删除用户](#删除用户)
    - [查看用户](#查看用户)
    - [修改用户](#修改用户)
- [组](#组)
    - [/etc/group](#etcgroup)
    - [/etc/ gshadow](#etc-gshadow)
    - [增加组](#增加组)
    - [删除组](#删除组)
    - [修改组](#修改组)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 用户
root的UID一定为0, 被分配的UID范围在500\~4294967295之间  

### /etc/passwd
保存用户信息  
```
用户名 : 密码占位符  : 用户id  : 组群id : 用户实名 : 主目录 : shell方式
root   : x           : 0       : 0      : root     : /root  : /bin/bash
```

### /etc/shadow
保存用户密码  
```
root:!:18056:0:99999:7:::
daemon:*:17937:0:99999:7:::

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

### 增加用户
`useradd [选项] <USER_NAME>`  
* `-u <UID>` 指定新用户的UID
* `-g <主用户组>` 指定主用户组, 可以为组名称或GID
* `-G <从属用户组>` 指定从属用户组, 可以为组名称或GID, 多个从属组以逗号分隔
* `-d <主目录>` 指定用户主目录
* `-M` 不为用户建立并初始化宿主目录
* `-s <shell类型>` 指定新用户shell类型
* `-e <时间>` 指定账号失效时间, 如`-e 2018-01-01`

### 删除用户
`userdel <User Name>`  
* `-r` 将用户目录一并删除

### 查看用户
`finger` 查看用户详细信息  
```sh
$ finger ypl
Login:  ypl                      Name:  ypl
Directory:  /home/ypl                    Shell:  /bin/bash
On since Thu Jun 13 13: 57 (CST) on : 0 from : 0 (messages off)
No mail.
No Plan.
```

<br>

`id` 显示用户的UID与所属组  
```sh
id ypl
uid=1000(ypl) gid=1000(ypl) groups=1000(ypl),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),116(lpadmin),126(sambashare)
```


### 修改用户
`usermod <User Name>`
* `-l` 修改用户名
* `-u <UID>` 
* `-g <主用户组>`
* `-G <从属用户组>`
* `-d <主目录>`
* `-s <shell类型>`
* `-L` 锁定用户账户, 与passwd命令的`-l`、`-u`选项作用基本相同, 只不过大小写存在区别 
* `-U` 解锁用户账户, 与passwd命令的`-l`、`-u`选项作用基本相同, 只不过大小写存在区别 



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 组
### /etc/group
```
ypl : x : 0 : ypl
组群名 : 密码 : 组群id : 组群成员列表
```

### /etc/ gshadow

### 增加组
`groupadd <GROUP_NAME> `
* `-g <GID>` 指定GID

### 删除组
`groupdel <GROUP_NAME>`

### 修改组
`groupmod  <GROUP_NAME>`
* `-n <GROUP_NAME>`
* `-g <GID>`

<br>

`gpasswd <用户名> <组名>`
* `-a 用户名` 向组内添加一个用户
* `-d 用户名` 从组内删除一个用户成员
* `-M` 定义组成员列表, 以逗号分隔

```sh
# 将用户 root 从 market 组中删除
gpasswd -d root market

# 将用户 benet 加入到 market 组中
gpasswd -a benet market
```
