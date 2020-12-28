# 服务器配置
```sh
# 启动
$ ssserver -c shadowsocks.json -d start

# 重启
$ ssserver -c shadowsocks.json -d restart
```

<form>
<textarea rows="13" cols="50">
{
    "server":"0.0.0.0",
    "port_password": {
        "8885": "123456",
        "8886": "123456",
        "8887": "123456",
        "8888": "123456",
        "8889": "123456"
    },
    "timeout":300,
    "method":"aes-256-cfb"
}
</textarea>
</form>

<form>
<textarea rows="8" cols="50">
{
    "server":"0.0.0.0",
    "server_port":1024,
    "password":"123456",
    "timeout":300,
    "method":"aes-256-cfb"
}
</textarea>
</form>

# 客户端配置
Setting -> Network -> Network Proxy -> Manual -> Socks Host(127.0.0.1:1080)
```sh
# 脚本方式
$ sslocal -c shadowsocks.json -d restart

# 命令行方式
$ sslocal -s 11.22.33.44 -p 1024 -k "123456" -b 127.0.0.1 -l 1080
```

<form>
<textarea rows="9" cols="50">
{
    "server":"11.22.33.44",
    "server_port":1024,
    "password":"123456",
    "local_port":1080,
    "timeout":300,
    "method":"aes-256-cfb"
}
</textarea>
</form>
