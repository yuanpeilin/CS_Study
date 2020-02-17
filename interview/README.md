# HashMap
* [ConcurrentHashMap](https://blog.csdn.net/justloveyou_/article/details/72783008)
* ConcurrentHashMap(没有fast-fail机制, HashMap才有)(fail fast 是对容器进行操作 此时新进来有元素 跟以前的记忆不一样 所以会抛异常 然后重新进行操作；fail safe 是以快照的形式进行操作 来个快照 然后进行数据操作 此时进来新的元素 不会抛出异常 会按照以前的快照继续进行操作)
* HashMap 和 ConcurrentHashMap 的区别
* HashMap和 HashTable有何不同
* ConcurrentHashMap和LinkedHashMap有什么区别
* hashmap怎么解决碰撞 为啥每次扩容是乘以2
* HashMap什么时候会进行rehash
* 结合源码说说 HashMap在高并发场景中为什么会出现死循环
* 为什么ConcurrentHashMap中的链表转红黑树的阀值是8
* 哈希表的查询知道吗 如何实现同一个key存储多个value呢
* 哈希表是否线程安全, 如何实现安全 
* hash表原理, 时间复杂度, 哈希冲突怎么解决 怎么插入

# 进程线程
* 进程和线程的概念和区别是什么, 多线程编程需要注意什么 
* 线程通信
* 进程间通信有哪些方式（我说了共享内存, 消息队列, 管道, 信号量, 套接字, 信号驱动）
* 进程间通信（即IPC问题）是并发中最关键, 要的问题  基本有三个大的解决方式
    * 基于通信: 管道pipe 消息队列messagequeue
    * 基于信号（唯一的异步I/O） 信号signal
    * 基于同步 信号量semaphore
* 怎么查看某个进程的状态 
* 说说什么是进程, 进程包括哪些数据  进程切换的过程是怎么样的 进程间切换算法有几种, 是什么
* Linux下进程虚拟空间布局 
* 进程与线程的切换
* 线程同步几种方式 锁, 信息量还有条件
* 计算机中进程同步的方法 线程同步的方法* [进程 线程](http://www.ruanyifeng.com/blog/2013/04/processes_and_threads.html)
* [线程通信:全局变量](https://blog.csdn.net/u011514810/article/details/77131296)
* [死锁](https://juejin.im/post/5aaf6ee76fb9a028d3753534)

# HTTP 
* http和https有什么区别
* http 状态码
* 一个http请求流转过程
* get post的区别, 我说到get的能接受的数据量比较小的时候, 面试官就说当传输数据量比较大会怎么样
* [HTTP报文: 请求行 请求头 空行 请求数据](https://www.cnblogs.com/biyeymyhjob/archive/2012/07/28/2612910.html)

# TCP
* 为什么tcp需要第三次握手 
* 为什么要四次挥手
* tcp请求的建立和断开
* TCP滑动窗口, 可靠性保证
* 四次挥手timewait作用 为什么2msl
* time_wait状态产生的原因、危害以及如何避免
* [三次握手四次挥手](https://blog.csdn.net/smileiam/article/details/78226816)
* [OSI七层模型](https://blog.csdn.net/yaopeng_2005/article/details/7064869)
* [TCP UDP](https://zhuanlan.zhihu.com/p/24860273)
* AB两台机器都正常工作, B机器未监听任何端口, 如果A机器向B机器80端口发送SYN包, 会收到何种类型的回包?(ACK RST FIN 不受到回包)

# Java多线程
* synchronized lock
* Volatile
* 说说对synchronized关键字的理解  如何分析阻塞代价 
* 如何保证线程安全 ThreadLocal
* 线程池超过线程数了会怎样
* AtomicInteger和synchronize
* 线程池知道吗 它的几个关键属性是什么
* runnable和callnabe
* 如果想要让多个线程执行到某个点, 都到之后再继续执行, 可以用java的那些类来实现 （CountDownLatch和CyclicBarrier这两个)

# 算法
* 链表
    * 单链表逆转
    * 单链表实现加法运算
    * 删除单链表倒数第k个节点(快排)
    * 合并两个有序链表
    * 单链表删除指定元素
    * 单向链表, 每隔k个做一次反转
    * 搜索树转双向链表
    * 一堆数中只有一个数出现了一次, 其余的数出现了两次, 找出只出现一次的数
    * 一堆数中只有一个数出现了一次, 其余的数出现了三次, 找出只出现一次的数
* 二叉树
    * 分别用递归和非递归的方式, 实现二叉树的先序、中序、后序遍历
    * 在二叉树中找到累加和为指定值的最长路径长度
    * 二叉树节点之间最大的距离
    * 验证二叉树是否是二叉搜索树
    * 输出二叉树每层的最大值
* 排序
    * 堆排序 问得非常详细, 包括堆的插入删除, 各个步骤的时间复杂度
    * 在线编写3通道快速排序稳定排序和不稳定排序
    * 堆排序建堆, 排序的时间复杂度
    * 怎么优化快速排序
    * 算法, 找数组中第十大的数 
* 字符串
    * 给定两个字符串, 求最长公共子序列
    * 给定两个字符串, 求最长公共子字符旨
    * 字符串转化为整数, 考察点主要是编码的严谨
    * 最大连续子数组和9：最长回文字串
    * 字符串逆转求可能代表的ip列表
    * 最长回文字串
* KMP 算法
* 1000瓶毒水最少需要多少只兔子能够找出毒水 
* 版本大小判断  
* 矩阵的最小路径和
* 汉诺塔问题
* 数组中, 子数组的最大累乘积
* 两个变量x、y, 在不引入第三个变量的情况下将x、y值互换 
* 有10个硬币, 我和你按顺序拿, 每次可以拿1、2或者4个, 拿到最后一个硬币的人输, 你怎么确保自己可以获胜(智力题)
* 3Sum, 4Sum, Combination Sum
* 数组中有一个数字出现的次数超过了数组长度的一半, 找出这个数字 
* 100亿个数, 求最大的1万个数, 并说出算法的时间复杂度 
* 从一个素数到另一个素数方式
* 一个素数A, 一个素数B, A转换成B有多少种路径
* 一个数组, 将0排除, 有正有负, 求最大子序列和
* 数组中有一个数字出现的次数超过了数组长度的一半, 找出这个数字 
* 100亿个数, 求最大的1万个数, 并说出算法的时间复杂度 
* 斐波那契数列 求第n项 我用的是动归, 用递归肯定不行 又讨论怎么正确输出第50项, 然后提示可以取余运算

# 数据结构
* ArrayList vs LinkedList vs Arrays
* arraylist linkedlist区别, 实现原理, 数组和array的内存分配
* 二叉树, B树, 红黑树 B树怎么通过索引进行查找
* B树与B+树的区别 
* 红黑树的左旋右旋以及变色的意义
* 将一个list的map转换为map的list

# 数据库
* 数据库第一范式第二范式
* 数据库键值为什么可以加快查找速度 
* 关系型数据库 非关系型数据库区别（然后可能给几个具体场景写sql）
* 数据库查找优化  在首先想到建立字段索引方法后, 还能想到用分表的方法去提高查询速度~
* 如何优化数据库索引
* 事务, 索引(复合索引, order by)
* UUID生成器
* 左连接和右连接的区别 
* mysql乐观锁悲观锁
* mysql集群
* 自增ID(锁太严重) UUID(不是顺序插入, 性能低) snowflake
* 聚簇索引 非聚簇索引
* [从一个表中选出A A在表中有重复 要求A不重复 然后最小值(B-C)排序 按C降序排列](http://www.runoob.com/mysql/mysql-handling-duplicates.html)
* 事物隔离级别 [1](http://www.cnblogs.com/zhoujinyi/p/3437475.html) [2](https://www.jianshu.com/p/4e3edbedb9a8)
* 索引 [1](https://blog.csdn.net/suifeng3051/article/details/52669644) [2](https://blog.csdn.net/weiliangliang111/article/details/51333169)


# Java
* equals设计原则
* ==, .isEquals()区别
* wait() notify() sleep()
* 三对一错
```
sleep()是Thread类的方法 wait()是Object类的方法
sleep()暂停线程, 但监控状态任然保持, 结束后会自动恢复
wait()后进入等待锁定池, 只有针对此对象发出notify()方法后获得对象锁进入运行状态
sleep()不释放对象锁, wait()放弃对象锁
```
* 泛型是否能重载?
* NIO byteBuffer channel selector
* Object下面的方法
* static关键字
* netty网络编程
* [线程池](https://www.cnblogs.com/dolphin0520/p/3932921.html)
* 深copy 浅copy
* [异常处理](https://blog.csdn.net/hguisu/article/details/6155636)
* `ArrayList list = new ArrayList();` 中的list扩容几次 
* 返回值
```
public boolean test(){
    try{
        return true;
    } catch (Exception e){

    } finally {
        return false;
    }
}
```

# JVM
* [内存分配](https://blog.csdn.net/suifeng3051/article/details/48292193)
* [GC](https://blog.csdn.net/suifeng3051/article/details/48292193)
* JVM内存 - 基础 堆栈区别, 延伸 JDK 6 7 8 的不同
* OOM发生的情况, 处理, 发生的区域
* jvm的原理, GC堆的垃圾回收机制
* 垃圾回收器有哪些
* 类加载机制, 过程, 双亲委派
* 常见的GC算法, 最好能说一种并行的, 延伸-FGC/YGC, 延伸-CMS vs G1
* Java内存回收机制和方法
* 类的加载机制: 双亲模型



*****************************************************************************************************


* SSL用什么加密算法, 如何加密
* 交换机和路由器的作用, 工作在哪一层
* 有名管道和无名管道
* ARP协议
* 什么是高并发 高性能 高可用
* load factor
* lru
* 信号量 如何加锁
* 生产者, 消费者
* 变量从产生到回收的过程
* url转义, 为什么出现乱码, 如何处理
* session cookie
* redirect和forward的区别
* rpc（dubbo）框架 spring ioc, spring boot优点
* 读锁, 写锁, 乐观锁, 悲观锁
* 多版本并发控制, 间隙锁
* nginx与tocat区别, 为什么性能查
* 文件的attribute 外存IO的具体流程
* 微服务思想和常用组件的作用, 包括rpc、mq 网关、服务注册、路由发现、数据传输格式、持续集成、线上监控等
* Linux的proc目录有啥用 
* 怎么查看端口的状态 
* 简述下正则化的原理和目的
* LCA
* 数据流中的中位数
* 蓄水池抽样
* 线程状态有哪些, 怎么转化
* 单例 / 工厂 
* BBR
* top/fee/vmstat/iotop/iostat/netstat等系统监控命令的使用, 包括命令输出某些关键字段的含义 
* Linux中load average意义
* Linux下查看CPU信息[/proc/cpuinfo]
* awk/sed/grep结合正则表达式的问题
* [大标题 1到11 , 能说的差不多, 就给过](https://blog.csdn.net/lzghxjt/article/details/51458540)
* 消息队列本身是异步的, 它允许接收者在消息发送很长时间后再取回消息, 这和大多数通信协议是不同的 例如WWW中使用的HTTP协议（HTTP/2之前）是同步的, 因为客户端在发出请求后必须等待服务器回应 然而, 很多情况下我们需要异步的通信协议 比如, 一个进程通知另一个进程发生了一个事件, 但不需要等待回应 但消息队列的异步特点, 也造成了一个缺点, 就是接收者必须轮询消息队列, 才能收到最近的消息  和信号相比, 消息队列能够传递更多的信息 与管道相比, 消息队列提供了有格式的数据, 这可以减少开发人员的工作量 [2]但消息队列仍然有大小限制  消息队列除了可以当不同线程或进程间的缓冲外, 更可以透过消息队列当前消息数量来侦测接收线程或进程性能是否有问题 
* 操作系统内存管理 
* 操作系统虚拟内存 
* Linux下进程虚拟空间布局 
* 互斥锁和读写锁以及信号量
* 什么是死锁 如何避免死锁 
* select和epoll的区别, epoll两种模式（ET和LT）的区别 
* 字节对齐相关题目 
* Linux中load average意义
* Linux下查看CPU信息[/proc/cpuinfo]
* 网络传输中的序列化
* linux的fork()方法
* linux中在终端里使用命令时干了啥, 比如ls, 但不是说它列出目录文件名这个  
* 乐观锁和悲观锁的具体代码实现
* redis的集群, 基本数据结构
* 网页cache的数据结构
* 八皇后
* 狄杰斯特拉
* 布隆过滤器
* [ReentrantLock](https://www.jianshu.com/p/96c89e6e7e90)
* 一个赛车手参加比赛, 共需要在赛场中跑n圈, 赛车最少跑一圈、最多跑三圈, 就需要进站一次请问有多少种进站策略
``
public static int cal(int n) {
if (n < 0) {
return 0;
}
if (n == 0) {
return 1;
}
return cal(n - 1) + cal(n - 2) + cal(n - 3);
}
递归与for循环的优劣
``
* 员工上班打卡, 9:30后算迟到
```
username,date,time
1. 10月15日当天, 有多少人迟到
2. 10月整月, 有哪些人迟到超过3次, 列出姓名和迟到次数 
```
* [一条木棍上有十只蚂蚁、求离开木棍的最短、最长时间](https://blog.csdn.net/seagal890/article/details/79360665)
* [单列模式 设计模式](http://www.runoob.com/design-pattern/design-pattern-intro.html)
* 10^n不充分数字
* [多线程实现](https://blog.csdn.net/u013278099/article/details/52317355)
* [大量url找某个是否存在](https://blog.csdn.net/v_JULY_v/article/details/6279498)
