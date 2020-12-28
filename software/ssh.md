# 配置文件
配置文件位于 */etc/ssh/sshd_config*
```sh
PermitRootLogin no # 禁止root登录
ClientAliveInterval 600 # 断线重连时间
MaxAuthTries 3 # 最大尝试次数
PasswordAuthentication no # 禁止密码登录
PermitEmptyPasswords no # 禁止空白密码登录
PubkeyAuthentication yes # 使用密钥登录
```
