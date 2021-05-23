# 语法
`ftp <ip address>`

# ftp命令
* `!` 在本地执行命令, 而非ftp服务器
* `ls`
* `cd`
* `lcd` 切换本地的路径
* `delete`
* `pwd`
* `hash`
* `get <remote path> [local path]` 下载某个文件
* `mget <remote path> [local path]` 下载多个文件, 可使用`*`进行模糊匹配. 执行此条命令之前执行`prompt off`可以取消提示
* `put <local path> <remote path>` 上传单个文件
* `mput <local path> <remote path>` 批量上传文件
* `ascii` 设置传输模式为ascii模式
* `binary` 设置传输模式为binary模式
* `bye`
