 # 目录
 


<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



 # HTTP特点
* **无连接:** 限制每次连接只处理一个请求
* **无状态:** HTTP协议对于事务处理没有记忆能力



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# HTTP报文
### 请求报文
HTTP请求报文由请求行, 请求头, 空行和报文主体组成
* 请求行(request line): 由请求方法, URI和HTTP协议版本组成
* 请求头(request header): 每行都是key:value的形式

```
GET /vl_explored_war/hello HTTP/1.1
Host: www.enjoytoday.cn
Connection: keep-alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.84 Safari/537.36
Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Encoding: gzip, deflate, sdch
Accept-Language: zh-CN,zh;q=0.8

username=hfcai&sex=man
```

### 响应报文
HTTP响应报文由响应行, 响应头, 空行和报文主体组成
* 响应行: 由相应协议版本, 响应状态码和响应状态描述组成
* 响应头: 每行都是key:value的形式

```
HTTP/1.1 200 OK
Date: Sat, 01 Jul 2017 14:51:26 GMT
Server: Apache/2.4.7 (Ubuntu)
Content-Language: zh-CN
Vary: Accept-Encoding
Content-Encoding: gzip
Content-Length: 7333
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html;charset=UTF-8
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# HTTP状态码
* 1XX 请求正在处理
* 2XX 请求成功
    * `200 OK` 请求成功
    * `204 No Content` 请求处理成功但没有资源可返回
    * `206 Partial Content` 服务器成功处理了部分GET请求
* 3XX 重定向
    * `301 Moved Permanenly` 请求的资源已被永久的移动到新URI, 返回信息会包括新的URI, 浏览器会自动定向到新URI
    * `302 Found` 资源的URI已临时定位到其他位置, 客户端应继续使用原有URI
    * `303 See Other` 资源的URI已更新
    * `304 Not Modified` 所请求的资源未修改, 服务器返回此状态码时, 不会返回任何资源
    * `307 Temporary Redirect` 临时重定向
* 4XX 客户端错误
    * `400 Bad Request` 请求报文中存在语法错误, 一般为参数异常
    * `401 Unauthorized` 发送的请求需要HTTP认证
    * `403 Forbiddden` 不允许访问, 对请求资源的访问被服务器拒绝
    * `404 Not Found` 无法找到请求的资源, 请求资源不存在
    * `405 Method Not Allowed` 请求的方式不支持
* 5XX 服务器错误
    * `500 Internal Server Error` 服务器的内部资源出故障, 服务器在执行请求时发生了错误
    * `502 Bad Gateway` 网关错误
    * `503 Service Unavailable` 服务器暂时处于超负载状态或正在进行停机维护, 无法处理请求, 服务器正忙



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 请求方法

METHOD | DESCRIPTION
------ | -----------
GET    | 请求读取URL所标识的信息
POST   | 向指定资源提交数据进行处理请求
GET    | 请求读取URL所标识的信息的首部



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# GET和POST

\\         | GET        | POST
---------- | ---------- | ----------
提交方式   | 数据附在URL之后, 以&和?连接 | 数据放在报文中
数据大小   | 有限制     | 无限制
安全性     | 有风险     | 更安全
