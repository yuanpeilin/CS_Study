# 安装
* 要求有java
* 下载graphviz `sudo apt install graphviz`
* 下载plantUML [https://plantuml.com/zh/download](https://plantuml.com/zh/download)
* vscode集成: 安装 **plantUML** 插件, 并在settings.json加入下面的内容
    - 修改Render为`PlantUMLServer`
    - 修改Server为`http://www.plantuml.com/plantuml`

# 箭头
* 实线箭头 `->` `<-`
* 虚线箭头 `-->` `<--`
* 表示丢失的消息 `->x`
* 让箭头只有上半部分或者下半部分 `-\` `/-`
* 细箭头 `->> -\\`
* 双向箭头 `<->`
* 箭头末尾加圈 `->o`
```plantuml
@startuml
a -> b : 实线箭头
a --> b : 虚线箭头
a ->x b : 丢失的消息
a -\ b : 箭头只有上半部分
a /- b : 箭头只有下半部分
a ->> b : 细箭头
a -\\ b : 细箭头
a <-> b : 双向箭头
a ->o b : 箭头末尾加圈
@enduml
```

# 时序图
### 参与者
* participant(参与者, 默认)
* actor(角色)
* boundary(边界)
* control(控制)
* entity(实体)
* database(数据库)
* collections(集合)
* queue(队列)
```plantuml
' 第一个`participant`是参与者类型, 第二个`participant`是显示在图上的名称
' 使用as定义别名
' 使用order定义参与者顺序, 但是需要将所有的参与者排序
' 在最后可定义参与者颜色
@startuml
title Example Title
autonumber
participant participant as Foo order 1 #red
actor actor1 as Foo1 order 2
boundary boundary2 as Foo2 order 3
control control3 as Foo3 order 4
entity entity4 as Foo4 order 5
database database5 as Foo5 order 6
collections collections6 as Foo6 order 77
queue queue7 as Foo7 order 8
Foo -> Foo1 : To actor
Foo -> Foo2 : To boundary
Foo -> Foo3 : To control
Foo -> Foo4 : To entity
Foo -> Foo5 : To database
Foo -> Foo6 : To collections
Foo -> Foo7 : To queue
@enduml
```

# 其他
* 增加标题 `title`
* 自动对消息编号 `autonumber`
* 给自己发消息 `用户 -> 用户: 登录操作`
* 让响应信息显示在箭头下面 `skinparam responseMessageBelowArrow true`
* 把一张图分割成多张 `newpage`
