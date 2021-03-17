# 基本配置
### 配置文件路径
配置文件路径位于 */etc/mongodb.conf*

### 配置文件详解
```yaml
dbpath=/var/lib/mongodb # mongod存储数据的目录
logpath=/var/log/mongodb/mongodb.log # 日志文件路径
port=27017 # 端口
```

### 远程访问
* `db.createUser({user:'root',pwd:'980620',roles:['root']})` 创建root用户并设置密码
* `db.createUser({user:'ypl',pwd:'980620',roles: [{role:'readWrite',db:'ypl'}]})`
* `db.auth('root','980620')` 验证用户, 返回1表示成功(要先执行use admin)
* `db.system.users.find()` 查看所有用户(要先执行use admin)
* 修改 /etc/mongodb.conf
```
bind_ip=0.0.0.0
noauth = off
auth = true
```

# 角色

| 角色                 | 描述                                           |
| -------------------- | ---------------------------------------------- |
| read                 | 指定数据库的读权限                             |
| readWrite            | 指定数据库的读写权限                           |
| readAnyDatabase      | 任何数据的读权限（除了config和local）          |
| readWriteAnyDatabase | 任何数据的读写权限（除了config和local）        |
| userAdminAnyDatabase | 指定数据库创建修改用户的权限                   |
| dbAdminAnyDatabase   | 任何数据库的读取、清理、修改、压缩、统计等权限 |
| dbAdmin              | 指定数据库的读取、清理、修改、压缩、统计等权限 |
| userAdmin            | 指定数据库创建和修改用户                       |
| clusterAdmin         | 对整个集群或者数据库系统进行管理操作           |
| backup               | 备份MongoDB数据                                |
| restore              | 还原MongoDB数据                                |
| root                 | 超级权限                                       |

# 系统初始数据库
* **local** 这个数据库永远不会被复制, 可以用来存储本地单台服务器的任意集合
* **config** 当mongodb分片设置时, config数据库用于保存分片信息
* **admin** 这是root数据库, 如果将一个用户添加到这个数据库, 这个用户就自动继承所有数据库的权限

# 数据库
* `use <database name>`   使用数据库, 如果数据库不存在就自动创建
* `show dbs`   查看当前有权限查看的所有数据库
* `show databases`   查看当前有权限查看的所有数据库
* `db`              正在使用的数据库
* `db.dropDatabase()`   删除数据库

# 集合
* `db.createCollection(<collection name>)`   创建集合
* `db.createCollection("user")`   比如创建一个叫user的集合
* `show tables`   查看当前数据库中的集合
* `show collections`   查看当前数据库中的集合
* `du.<collection name>.drop()`   删除集合

# 文件操作
* `mongofiles -d <database name> -l <local file path> put <new file name>` 存储文件
* `mongofiles -d <database name> list` 列出所有文件
* `mongofiles -d <database name> get <file name>` 获取文件
* `mongofiles -d <database name> -l <local path> get <file name>` 获取文件
* `mongofiles -d <database name> delete <file name>` 删除文件

# 插入文档
* `db.<collection name>.save(<BSON Document>)`   插入文档. 如果 _id 主键存在则更新数据, 如果不存在就插入数据, 该方法新版本中已废弃
* `db.<collection name>.insert(<BSON Document>)`   插入文档. 若插入的数据主键已经存在, 则会抛`org.springframework.dao.DuplicateKeyException`异常, 提示主键重复, 不保存当前数据
* `db.<collection name>.insertOne(<BSON Document>)`   插入文档
* `db.user.insert({name: "张三", age: 23})`   插入文档
* **批量插入** 如果在插入过程中有一条数据失败, 就会终止插入, 但是在此之前的数据都会插入成功
* 插入数据较多的情况下可能会报错, 可以在命令前后使用try catch进行异常捕捉
```
db.<collection name>.insertMany(
    [<BSON Document1>, <BSON Document2>...],
    {
        ordered: 指定MongoDB是否有序插入. 可选值
    }
)

try {
    db.<collection name>.insertMany()
} catch(e) {
    print(e)
}
```

# 更新文档
* 格式
```
db.<collection name>.update(
    {BSON格式查询条件},
    {BSON格式要更新的内容},
    {
        upsert: 布尔类型, 指定如果不存在update的记录, 是否插入. 默认false
        multi: 默认false, 只更新找到的第一条记录. 如果为true, 则更新查询条件下的所有记录
    }
)
```

* **覆盖修改** 修改完成后发现这条文档只剩下name字段了, 其他字段被覆盖掉了, 因此实际使用不可以这么写
```
db.user.update(
    {_id: "1"},
    {name, "李四"}
)
```

* **局部修改** 使用修改器`$set`来实现, 修改成功后其他字段依然存在
```
db.user.update(
    {_id: "1"},
    {$set: {name: "李四"}}
)
```

* **批量修改** 更新所有年龄是18岁的用户, 年龄更新为19
```
db.user.update(
    {age: NumberInt(18)},
    {$set: {age: NumberInt(19)}},
    {multi: true}
)
```

* **列值自增** 使用`$inc`
```
db.<collection name>.update(
	{_id: "1"},
	{$inc: {age: NumberInt(1)}}
)
```

# 删除文档
* `db.<collection name>称.remove(BSON格式条件)`
* `db.<collection name>称.remove({})` 删除所有数据

# 查询文档
* 查询使用`find()`或者`findOne()`
* `db.<collection name>.find(BSON格式条件).pretty()`
* `db.user.find({_id: "1"})`   查询编号是1的用户
* `db.user.find({sex: "1", age: "18"})`   `find()`方法可以传入多个键值对, 类似于SQL的AND条件
* `db.<collection name>.find({$or: [{key1, value1}, {key2, value2}]})`   关键字 `$or` 用来实现or查询
* `db.user.find({$or: [{age: 17}, {age: 19}]})`   查询年龄是17或者19的用户
* `db.user.find({sex: "1", $or: [{age: 17}, {age: 19}]})`   查询性别是男, 并且年龄是17或者19的用户
* `db.user.find({_id: "1"}, {name: 1, age: 1, _id: 0})`   投影查询, 只查询name, age字段
* `db.<collection name>.count(BSON格式条件)`   统计查询
* `db.user.count({age: "1"})`   统计所有性别为男的数据
* 分页查询, 使用`limit`读取指定数量的数据, `skip`跳过指定数量的数据, 二者搭配来进行分页查询. limit参数默认是20, skip参数默认是0
* `db.<collection name>.find().limit(3)`   查询返回前三条记录
* `db.<collection name>.find().skip(3)`   跳过前3条记录
* `db.<collection name>.find().skip(0).limit(2)`   每页查询2条数据
* `db.<collection name>.find().skip(2).limit(2)`   每页查询2条数据
* `db.<collection name>.find().skip(3).limit(2)`   每页查询2条数据
* `db.user.find().sort({sex: 1, age: -1})`   sort方法可以指定排序的字段, 值为1升序, 值为-1降序. 根据性别升序排序, 并根据年龄降序排序

操作        | 格式                               | 范例                                 | MySQL中类似语句                        
----------- | ---------------------------------- | ------------------------------------ | ---------------------------------------
等于        | {key, value}                       | db.user.find({_id: 1})               | where id = 1                           
小于        | {key, {$lt: value}                 | db.user.find({age: {$lt: 18}})       | where age < 18                         
小于等于    | {key, {$lte: value}}               | db.user.find({age: {$lte: 18}})      | where age <= 18                        
大于        | {key, {$gt: value}}                | db.user.find({age: {$gt: 18}})       | where age > 18                         
大于等于    | {key, {$gte: value}}               | db.user.find({age: {$gte: 18}})      | where age >= 18                        
不等于      | {key, {$ne: value}}                | db.user.find({age: {$ne: 18}})       | where age != 18                        
包含        | {key, /value/}                     | db.user.find(name: /俊/)             | where name like '%俊%'                 
在...之中   | {key, {$in: [value1, value2...]}}  | db.user.find(age: {$in: [1,2,3]})    | where age in (1,2,3)                   
不在...之中 | {key, {$nin: [value1, value2...]}} | db.user.find(age: {$nin: [1,2,3]})   | where age not in (1,2,3)               
类型为...   | {key: {$type: "string"}}           | db.user.find(age: {$type: 'string'}) | 无. 查询用户集合中age是String类型的数据

# 角色
* `db.runCommand({rolesInfo: 1})`   查询所有角色权限(仅用户自定义角色)
* `db.runCommand({rolesInfo: 1, showBuiltinRoles: true})`   查询所有角色权限(包含内置角色)
* `db.runCommand({rolesInfo: 角色名})`   查询当前数据库中指定角色的权限
* `db.runCommand({rolesInfo: {role: 角色名, db: 数据库名}})`   查询其他数据库中指定的角色权限

### 常见角色

| 角色                 | 描述                                           |
| -------------------- | ---------------------------------------------- |
| read                 | 指定数据库的读权限                             |
| readWrite            | 指定数据库的读写权限                           |
| readAnyDatabase      | 任何数据的读权限(除了config和local)            |
| readWriteAnyDatabase | 任何数据的读写权限(除了config和local)          |
| userAdminAnyDatabase | 指定数据库创建修改用户的权限                   |
| dbAdminAnyDatabase   | 任何数据库的读取、清理、修改、压缩、统计等权限 |
| dbAdmin              | 指定数据库的读取、清理、修改、压缩、统计等权限 |
| userAdmin            | 指定数据库创建和修改用户                       |
| clusterAdmin         | 对整个集群或者数据库系统进行管理操作           |
| backup               | 备份MongoDB数据                                |
| restore              | 还原MongoDB数据                                |
| root                 | 超级权限                                       |
