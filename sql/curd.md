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
#### 创建表
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

#### 删除表
```sql
DROP TABLE [IF EXISTS] table_name;
```
<br>

#### 查看表的结构
```sql
SHOW CREATE TABLE table_name;

SHOW COLUMNS FROM table_name;
```
<br>

#### 显示所有的表
```sql
SHOW TABLES;
```
<br>

#### 修改表名
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
#### 添加列 
```sql
ALTER TABLE table_name 
ADD [COLUMN] column_name column_definition 
[FIRST | AFTER column_name]

    # 例子
    ALTER TABLE student ADD age TINYINT NOT NULL AFTER name;
```
<br>

#### 删除列
```sql
ALTER TABLE table_name DROP [COLUMN] column_name
```
<br>

#### 查看列
```sql
SHOW COLUMNS FROM table_name
```
<br>

#### 修改列定义
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


<br>

**********************************************************************************************************************

<br>


# 操作数据 [`顶部`](#user-content-索引)
#### 新增数据
* 可以一次性插入多条数据
```sql
INSERT [INTO] table_name [(column_name1, column_name2,...column_nameN)]
VALUES
({value1 | DEFAULT}, {value2 | DEFAULT},...{valueN | DEFAULT}),
(...);

    # 例子
    INSERT INTO runoob_tbl 
    (runoob_title, runoob_author, submission_date)
    VALUES
    ("学习 PHP", "菜鸟教程", NOW());
```
* 此方法可以使用子查询（SubQuery）
```sql
INSERT [INTO] table_name SET column_name={value | DEFAULT),column_name={value | DEFAULT),...
    
    # 例子
    INSERT INTO test(username) 
    SELECT username FROM users WHERE age>50; 
```
<br>

#### 删除数据
```sql
# 单表删除
DELETE FROM table_name [WHERE where_condition];

    DELETE FROM runoob_tbl WHERE runoob_id=3;
```
```sql
# 多表删除
DELETE table_name[.*] [, table_name[.*l] ...
FROM table_references
[WHERE where_condition]

    DELETE t1 FROM tdb_goods AS t1 LEFT JOIN (
    SELECT goods_id,goods_name FROM tdb_goods 
    GROUP BY goods_name HAVING COUNT(goods_name) >= 2) AS t2
    ON t1.goods_name = t2.goods_name
    WHERE t1.goods_id > t2.goods_id;
```

<br>

#### 修改数据
```sql
# 单表更新
UPDATE [LOW_PRIORITY] [IGNORE] table_reference 
SET column_name1={VALUE1 | DEFAULT} [, column_name2={VALUE12 | DEFAULT}]... 
[WHERE where_condition]

    # 例子
    UPDATE user SET age = age + 5 WHERE id % 2 = 0;

    # 例子
    UPDATE user SET age = age - id, sex = 0;
```
```sql
# 多表更新
UPDATE table_references
SET（column_name1={expr1 | DEFAULT} [, column_name2={expr2 | DEFAULT}]...
[WHERE where_condition]

    # 例子
    UPDATE tdb_goods INNER JOIN tdb_goods_cates ON goods_cate = cate_name
    SET goods_cate = cate_id;

    # 例子
    UPDATE tdb_goods INNER JOIN tdb_goods_brands ON tdb_goods.brand_name = tdb_goods_brands.brand_name
    SET tdb_goods.brand_name = tdb_goods_brands.brand_id;
```

<br>

#### 查询数据
```sql
SELECT select_expr [, select_expr ...]
[
    FROM table_references
    [WHERE where_condition]
    [GROUP BY {column_name | position} [ASC | DESC], ... ]
    [HAVING where_conditionl]
    [ORDER BY {column_name | expr | position} [ASC | DESC], ... ] # ASC升序(123) DESC降序(321)
    [LIMIT {[offset,] row_count | row_count OFFSET offset}]
]

    # 别名
    SELECT id AS i, username AS un FROM user;

    # 默认情况下HAVING对所有记录分组, HAVING可以只对指定记录分组
    # 分组条件要么为聚合函数, 要么出现在SELECT中
    SELECT sex FROM users GROUP BY sex HAVING SUM(age)>30;

    # 排序
    SELECT * FROM users ORDER BY id,age DESC;

    # 返回2条数据
    SELECT * FROM users LIMIT 2;

    # 从0开始编号, 返回包括第2条在内的3条数据
    SELECT * FROM users LIMIT 2,3;
```
