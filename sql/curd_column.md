# 目录
- [添加列](#添加列)
- [删除列](#删除列)
- [查看列](#查看列)
- [修改列定义](#修改列定义)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 添加列
### 语法
```sql
ALTER TABLE <TABLE_NAME> 
ADD [COLUMN] COLUMN_NAME COLUMN_DEFINITION 
[FIRST | AFTER COLUMN_NAME]
```

### 例子
```sql
ALTER TABLE student
ADD age TINYINT NOT NULL
AFTER name;
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 删除列
### 语法
```sql
ALTER TABLE <TABLE_NAME> 
DROP [COLUMN] COLUMN_NAME
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 查看列
### 语法
```sql
SHOW COLUMNS FROM <TABLE_NAME>;
```
```sql
DESCRIBE <TABLE_NAME>;
```



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 修改列定义
### 语法
```sql
ALTER TABLE <TABLE_NAME> 
MODIFY [COLUMN] COLUMN_NAME COLUMN_DEFINITION 
[FIRST丨AFTER COLUMN_NAME]
```
```sql
ALTER TABLE <TABLE_NAME> 
CHANGE [COLUMN] old_COLUMN_NAME new_COLUMN_NAME COLUMN_DEFINITION 
[FIRST | AFTER COLUMN_NAME]
```

### 例子
```sql
ALTER TABLE qq
MODIFY username VARCHAR(45)
FIRST;
```
```sql
ALTER TABLE qq
CHANGE username username VARCHAR(45)
AFTER id;
```
