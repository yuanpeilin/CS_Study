# 新增数据
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
<br>



# 删除数据
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
<br>



# 修改数据
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
<br>



# 查询数据
1. **格式**
```sql
SELECT select_expr [, select_expr ...]
[
    FROM table_references
    [WHERE where_condition]
    [GROUP BY {column_name | position} [ASC | DESC], ... ]
    [HAVING where_conditionl]
    [ORDER BY {column_name | expr | position} [ASC | DESC], ... ]
    [LIMIT {[offset,] row_count | row_count OFFSET offset}]
]
```

2. **检索不同的行 DISTINCT**  
DESTINCT关键字只返回不同的值, 即相同的值只返回一次  
如果修饰两个或两个以上的列, 那么以两个列同时为条件, 只有两个列的值都相同时, 才算相同  
```sql
SELECT DISTINCT  vend_id, prod_price FROM products;
+---------+------------+
| vend_id | prod_price |
+---------+------------+
|    1003 |       2.50 |
|    1003 |       2.50 |
|    1003 |       4.49 |
|    1003 |      10.00 |
|    1003 |      10.00 |
+---------+------------+

SELECT DISTINCT vend_id, prod_price FROM products ORDER BY vend_id,prod_price;
+---------+------------+
| vend_id | prod_price |
+---------+------------+
|    1003 |       2.50 |
|    1003 |       4.49 |
|    1003 |      10.00 |
+---------+------------+
```

3. **限制行数 LIMIT**  
`LIMIT 3` 返回前三条记录(返回第零条 第一条 第二条记录)  
`LIMIT 3, 2` 从0开始编号, 包括第三条记录, 返回两条记录(返回第三条 第四条记录)  
```sql
SELECT * FROM users LIMIT 3;
SELECT * FROM users LIMIT 3, 2;
```

4. **排序 ORDER BY**  
默认为ASC升序(A-Z 1-9), 还可以设置为DESC降序(Z-A 9-1)  
ORDER BY子句应该保证它位于FROM子句之后. 如果使用LIMIT, 它必须位于ORDER BY之后  
```sql
# 排序
SELECT * FROM users ORDER BY id, age DESC;
```

5. **空值检查 IS NULL**  
```sql
SELECT cust_id FROM customers WHERE cust_email IS NULL;

+---------+
| cust_id |
+---------+
|   10002 |
|   10005 |
+---------+
```

6. **过滤数据 WHERE**  
```sql
SELECT prod_name, prod_price FROM products WHERE prod_price BETWEEN 5 AND 10;

+----------------+------------+
| prod_name      | prod_price |
+----------------+------------+
| .5 ton anvil   |       5.99 |
| 1 ton anvil    |       9.99 |
| Bird seed      |      10.00 |
| TNT (5 sticks) |      10.00 |
+----------------+------------+
```

7. **组合WHERE子句 AND OR**  
SQL在处理OR操作符之前, 会优先处理AND操作符. 在同时使用AND和OR时, 应使用圆括号明确地分组相应的操作符  
```sql
SELECT prod_name, prod_price 
FROM products 
WHERE (vend_id=1002 OR vend_id=1003) AND prod_price>=10;

+----------------+------------+
| prod_name      | prod_price |
+----------------+------------+
| Detonator      |      13.00 |
| Bird seed      |      10.00 |
| Safe           |      50.00 |
| TNT (5 sticks) |      10.00 |
+----------------+------------+
```

8. **WHERE子句 IN**  
IN操作符用来指定条件范围, 范围中的每个条件都可以进行匹配. IN取合法值的由逗号分隔的清单, 全都括在圆括号中  
```sql
SELECT prod_name, prod_price 
FROM products 
WHERE vend_id IN (1002, 1003);

+----------------+------------+
| prod_name      | prod_price |
+----------------+------------+
| Detonator      |      13.00 |
| Bird seed      |      10.00 |
| Carrots        |       2.50 |
| Fuses          |       3.42 |
| Oil can        |       8.99 |
| Safe           |      50.00 |
| Sling          |       4.49 |
| TNT (1 stick)  |       2.50 |
| TNT (5 sticks) |      10.00 |
+----------------+------------+
```







* 别名
```sql
# 别名
SELECT id AS i, username AS un FROM user;
```
```sql
# 默认情况下HAVING对所有记录分组, HAVING可以只对指定记录分组
# 分组条件要么为聚合函数, 要么出现在SELECT中
SELECT sex FROM users GROUP BY sex HAVING SUM(age)>30;
```
