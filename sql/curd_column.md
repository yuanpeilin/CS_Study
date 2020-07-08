# 目录
- [操作列](#操作列)
    - [添加列](#添加列)
    - [删除列](#删除列)
    - [查看列](#查看列)
    - [修改列定义](#修改列定义)



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 操作列
### 添加列 
```sql
ALTER TABLE table_name 
ADD [COLUMN] column_name column_definition 
[FIRST | AFTER column_name]
```
```sql
ALTER TABLE student
ADD age TINYINT NOT NULL
AFTER name;
```

### 删除列
```sql
ALTER TABLE table_name 
DROP [COLUMN] column_name
```

### 查看列
以下两句等价  
```sql
SHOW COLUMNS FROM <table_name>;
```
```sql
DESCRIBE <table_name>;
```

### 修改列定义
```sql
ALTER TABLE table_name 
MODIFY [COLUMN] column_name column_definition 
[FIRST丨AFTER column_name]
```
```sql
ALTER TABLE qq
MODIFY username VARCHAR(45)
FIRST;
```

<br>

```sql
ALTER TABLE table_name 
CHANGE [COLUMN] old_column_name new_column_name column_definition 
[FIRST | AFTER column_name]
```
```sql
ALTER TABLE qq
CHANGE username username VARCHAR(45)
AFTER id;
```
