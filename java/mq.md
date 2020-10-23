# 命令
### 安装
sudo apt install rabbitmq-server 

### 配置文件
vim /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.10/ebin/rabbit.app 

### 启动web服务
15672端口
sudo rabbitmq-plugins list
sudo rabbitmq-plugins enable rabbitmq_management

### 重启启动
sudo service rabbitmq-server start
sudo rabbitmqctl start_app
sudo rabbitmqctl start

### 远程访问
新建用户
rabbitmqctl add_user admin adminPassword
赋予权限
rabbitmqctl set_user_tags admin administrator
赋予virtual host中所有资源的配置、写、读权限以便管理其中的资源，也是添加远程访问权限
`rabbitmqctl set_permissions -p "/" admin ".*" ".*" ".*" `

# 笔记
一个exchange可以绑定多个queue