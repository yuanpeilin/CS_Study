# 目录
- [操作数据库](#操作数据库)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 操作数据库
* 新建数据库
```sql
CREATE DATABAS [IF NOT EXISTS] database_name [DEFAULT] CHARACTER SET [=] charset_name;
```

* 删除数据库
```sql
DROP DATABASE [IF EXISTS] database_name;
```

* 查看所有数据库
```sql
SHOW DATABASES;
```

* 查看数据库结构
```sql
SHOW CREATE DATABASE database_name;
```

* 修改数据库(字符集)
```sql
ALTER DATABASE database_name [CHARACTER SET charset_name];
```

* 使用数据库
```sql
USE database_name;
```