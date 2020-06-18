# 索引
* [**操作数据库**](#user-content-操作数据库-顶部)
* [**操作表**](#user-content-操作表-顶部)
* [**操作表的结构**](#user-content-操作表的结构-顶部)
* [**操作数据**](#user-content-操作数据-顶部)

**********************************************************************************************************************

# 操作数据库 [`顶部`](#user-content-索引)
* 新建数据库
```sql
CREATE DATABAS [IF NOT EXISTS] database_name [DEFAULT] CHARACTER SET [=] charset_name;
```
<br>

* 删除数据库
```sql
DROP DATABASE [IF EXISTS] database_name;
```
<br>

* 查看所有数据库
```sql
SHOW DATABASES;
```
<br>

* 查看数据库结构
```sql
SHOW CREATE DATABASE database_name;

```
<br>

* 修改数据库(字符集)
```sql
ALTER DATABASE database_name [CHARACTER SET charset_name];
```
<br>

* 使用数据库
```sql
USE database_name;
```


<br>

**********************************************************************************************************************

<br>


# 操作表 [`顶部`](#user-content-索引)
### 创建表
```sql
CREATE TABLE [IF NOT EXISTS] table_name (
    字段名 数据类型 [NOT NULL | NULL] [DEFAULT 默认值] [AUTO_INCREMENT] [UNIQUE | PRIMARY KEY] [COMMENT 'string']
    ...
);

    # 例子
    CREATE TABLE IF NOT EXISTS test.tb1(
        username VARCHAR(20),
        age TINYINT UNSIGNED,
        salary float(8,2) UNSIGNED
    );

    # 例子
    CREATE TABLE IF NOT EXISTS `runoob_tbl`(
       `runoob_id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
       `runoob_title` VARCHAR(100) NOT NULL,
       `sex` ENUM('male','female'),
       PRIMARY KEY ( `runoob_id` )
    )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```
<br>

### 删除表
```sql
DROP TABLE [IF EXISTS] table_name;
```
<br>

### 查看表的结构
```sql
SHOW CREATE TABLE table_name;

customers | CREATE TABLE `customers` (
`cust_id` int(11) NOT NULL AUTO_INCREMENT,
`cust_name` char(50) NOT NULL,
`cust_address` char(50) DEFAULT NULL,
`cust_city` char(50) DEFAULT NULL,
`cust_state` char(5) DEFAULT NULL,
`cust_zip` char(10) DEFAULT NULL,
`cust_country` char(50) DEFAULT NULL,
`cust_contact` char(50) DEFAULT NULL,
`cust_email` char(255) DEFAULT NULL,
PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=latin1
```
<br>

### 显示所有的表
```sql
SHOW TABLES;
```
<br>

### 修改表名
```sql
# 方法1
ALTER TABLE table_name 
RENAME [TO | AS] new_table_name
```
```sql
# 方法2
RENAME TABLE table_name TO new_table_name 
[, table_name2 TO new_tabIe_name2]...
```


<br>

**********************************************************************************************************************

<br>


# 操作表的结构 [`顶部`](#user-content-索引)
### 添加列 
```sql
ALTER TABLE table_name 
ADD [COLUMN] column_name column_definition 
[FIRST | AFTER column_name]

    # 例子
    ALTER TABLE student ADD age TINYINT NOT NULL AFTER name;
```
<br>

### 删除列
```sql
ALTER TABLE table_name DROP [COLUMN] column_name
```
<br>

### 查看列
```sql
SHOW COLUMNS FROM <table_name>;
-- 相当于
DESCRIBE <table_name>;

+--------------+-----------+------+-----+---------+----------------+
| Field        | Type      | Null | Key | Default | Extra          |
+--------------+-----------+------+-----+---------+----------------+
| cust_id      | int(11)   | NO   | PRI | NULL    | auto_increment |
| cust_name    | char(50)  | NO   |     | NULL    |                |
| cust_address | char(50)  | YES  |     | NULL    |                |
| cust_city    | char(50)  | YES  |     | NULL    |                |
| cust_state   | char(5)   | YES  |     | NULL    |                |
| cust_zip     | char(10)  | YES  |     | NULL    |                |
| cust_country | char(50)  | YES  |     | NULL    |                |
| cust_contact | char(50)  | YES  |     | NULL    |                |
| cust_email   | char(255) | YES  |     | NULL    |                |
+--------------+-----------+------+-----+---------+----------------+
```
<br>

### 修改列定义
```sql
ALTER TABLE table_name 
MODIFY [COLUMN] column_name column_definition 
[FIRST丨AFTER column_name]

    # 例子
    ALTER TABLE qq MODIFY username VARCHAR(45) FIRST;
```
```sql
ALTER TABLE table_name 
CHANGE [COLUMN] old_column_name new_column_name column_definition 
[FIRST | AFTER column_name]

    # 例子
    ALTER TABLE qq CHANGE username username VARCHAR(45) AFTER id;
```
