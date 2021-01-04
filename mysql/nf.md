# 目录
* 1



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 范式
### 作用
* 减少冗余
* 解决插入, 删除, 修改冲突

### 第一范式(1NF)
* 所有字段都只有单一属性, 如'张三-男'就不行
* 单一属性的列都是由基本数据类型构成, 如'数组, 集合'就不行
* 设计出来的表都是简单的二维表

### 第二范式(2NF)
* 表中只具有一个业务主键, 也就是说不能存在非主键列只对部分主键的依赖关系

### 第三范式(3NF)
* 每一个非主属性既不部分依赖于也不依赖传递于业务主键