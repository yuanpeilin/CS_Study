# 安装
* **安装命令** `sudo apt install rabbitmq-server`
* **配置文件路径** `/usr/lib/rabbitmq/lib/rabbitmq_server-3.6.10/ebin/rabbit.app`
* **默认端口** 15672

### 启用web服务插件
```sh
sudo rabbitmq-plugins list
sudo rabbitmq-plugins enable rabbitmq_management
```

### 启动
```sh
sudo rabbitmqctl start
sudo rabbitmqctl start_app
sudo service rabbitmq-server start
```

### 远程访问
```sh
# 新建用户(记得改密码)
sudo rabbitmqctl add_user admin adminPassword
# 赋予权限
sudo rabbitmqctl set_user_tags admin administrator
# 赋予virtual host中所有资源的配置、写、读权限以便管理其中的资源，也是添加远程访问权限
sudo rabbitmqctl set_permissions -p "/" admin ".*" ".*" ".*"
```

# 笔记
一个exchange可以绑定多个queue
