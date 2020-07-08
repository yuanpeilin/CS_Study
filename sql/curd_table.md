# 目录
- [操作表](#操作表)
    - [创建表](#创建表)
    - [删除表](#删除表)
    - [查看表的结构](#查看表的结构)
    - [显示所有的表](#显示所有的表)
    - [修改表名](#修改表名)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 操作表
### 创建表
```sql
CREATE TABLE IF NOT EXISTS customers
(
    cust_id      int       NOT NULL AUTO_INCREMENT,
    cust_name    char(50)  NOT NULL ,
    cust_address char(50)  NULL ,
    cust_city    char(50)  NULL ,
    cust_state   char(5)   NULL ,
    cust_zip     char(10)  NULL ,
    cust_country char(50)  NULL ,
    cust_contact char(50)  NULL ,
    cust_email   char(255) NULL ,
    PRIMARY KEY (cust_id)
) ENGINE=InnoDB;
```

```sql
CREATE TABLE IF NOT EXISTS customers
(
    cust_id      int unsigned          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cust_sex     ENUM('male','female') NOT NULL ,
    cust_address char(50)              NULL ,
    cust_city    char(50)              NULL ,
    cust_state   char(5)               NULL ,
    cust_zip     char(10)              NULL ,
    cust_country char(50)              NULL ,
    cust_contact char(50)              NULL ,
    cust_email   char(255)             NULL ,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

* 组合主键
```sql
(
  order_num  int          NOT NULL ,
  order_item int          NOT NULL ,
  prod_id    char(10)     NOT NULL ,
  quantity   int          NOT NULL DEFAULT 1,
  item_price decimal(8,2) NOT NULL ,
  PRIMARY KEY (order_num, order_item)
) ENGINE=InnoDB;
```

### 删除表
```sql
DROP TABLE [IF EXISTS] table_name;
```

### 查看表的结构
```sql
SHOW CREATE TABLE table_name;

CREATE TABLE `customers` (
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

### 显示所有的表
```sql
SHOW TABLES;
```

### 修改表名
```sql
ALTER TABLE table_name 
RENAME [TO | AS] new_table_name
```
```sql
RENAME TABLE table_name TO new_table_name 
[, table_name2 TO new_tabIe_name2]...
```
