# 拼接字段 Concat()
```sql
SELECT Concat(vend_name, '(', vend_country, ')') FROM vendors;

+-------------------------------------------+
| Concat(vend_name, '(', vend_country, ')') |
+-------------------------------------------+
| Anvils R Us(USA)                          |
| LT Supplies(USA)                          |
| ACME(USA)                                 |
| Furball Inc.(USA)                         |
| Jet Set(England)                          |
| Jouets Et Ours(France)                    |
+-------------------------------------------+
```

# 别名
别名是一个字段或计算字段的替换值  
```sql
SELECT Concat(RTrim(vend_name), '(', RTrim(vend_country), ')') AS vend_title FROM vendors;

+------------------------+
| vend_title             |
+------------------------+
| Anvils R Us(USA)       |
| LT Supplies(USA)       |
| ACME(USA)              |
| Furball Inc.(USA)      |
| Jet Set(England)       |
| Jouets Et Ours(France) |
+------------------------+
```

# 测试  
```sql
SELECT 3*2;

+-----+
| 3*2 |
+-----+
|   6 |
+-----+
```
```sql
SELECT Trim(' 123  ');

+----------------+
| Trim(' 123  ') |
+----------------+
| 123            |
+----------------+
```

# 算术计算
计算字段的另一常见用途是对检索出的数据进行算术计算  
* **格式**  
```sql
SELECT prod_id,
       quantity,
       item_price,
       quantity*item_price AS total_price
FROM orderitems WHERE order_num=20005;

+---------+----------+------------+-------------+
| prod_id | quantity | item_price | total_price |
+---------+----------+------------+-------------+
| ANV01   |       10 |       5.99 |       59.90 |
| ANV02   |        3 |       9.99 |       29.97 |
| TNT2    |        5 |      10.00 |       50.00 |
| FB      |        1 |      10.00 |       10.00 |
+---------+----------+------------+-------------+
```
