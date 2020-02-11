# 执行计划
* 使用`EXPLAIN`关键字可以模拟优化器执行SQL查询语句, 从而知道MySQL是如何处理SQL语句的
* **`EXPLAIN SQL语句`**
* 主要看**是否用到索引**和**是否充分利用索引**
    * **key** 有值则用到索引
    * **key_len** 不同数据类型算法不同. 字符串(类型:char+0 varchar+2)(字符编码 utf8: 3)(字符本身长度 长度乘以字符编码)(是否为空 空+1 非空+0)
    * **type** 显示的是访问类型, 从好到坏: system>const>eq_ref>ref>range>index(全局扫描索引表)>ALL(全表扫描)
