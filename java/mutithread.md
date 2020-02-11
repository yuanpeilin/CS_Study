# Java多线程
* [**基本性质**](#user-content-基本性质-java多线程)
* [**volatile**](#user-content-volatile-java多线程)
* [**Synchronized**](#user-content-synchronized-java多线程)
* [**JMM数据原子操作**](#user-content-jmm数据原子操作-java多线程)
* [**缓存不一致问题**](#user-content-缓存不一致问题-java多线程)

************************************************************

# 基本性质
* **原子性** 是指在一个操作中就是cpu不可以在中途暂停然后再调度, 既不被中断操作, 要不执行完成, 要不就不执行
* **可见性** 是指当多个线程访问同一个变量时, 一个线程修改了这个变量的值, 其他线程能够立即看得到修改的值
* **有序性** 即程序执行的顺序按照代码的先后顺序执行

# volatile
保证修饰的变量具有**可见性和有序性**, 不保证原子性
```java
public class Main {
    private static volatile boolean flag = false;
    //  private static  boolean flag = false;

    public static void main(String[] args) throws InterruptedException {
        new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("11111111111 start");
                while (!flag) {}
                System.out.println("111111111111 end");
            }
        }).start();

        Thread.sleep(2000);

        new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("22222222222 start");
                flag = true;
                System.out.println("22222222222 end");
            }
        }).start();
    }
}
```

# Synchronized
* 同步实例方法, 锁是当前实例对象
* 同步类方法, 锁是当前类对象
* 同步代码块, 锁是括号里面的对象
多个线程同时访问共享可变的资源
保证方法或者代码块的**原子性**
被synchronized描述的方法或代码块同一时间只能有一个线程进行访问
```java
public class Main {

    private static volatile int num = 0;

    //    private static  void increase() {
    private static synchronized void increase() {
        num++;
    }

    public static void main(String[] args) throws InterruptedException {
        Thread[] threads = new Thread[10];
        for (int i = 0; i < threads.length; i++) {
            threads[i] = new Thread(new Runnable() {
                @Override
                public void run() {
                    for (int j = 0; j < 1000; j++) {
                        increase();
                    }
                }
            });
            threads[i].start();
        }

        for (Thread t : threads) {
            t.join();
        }
        System.out.println(num);
    }
}
```

# JMM数据原子操作
* **read (读取)** 从主内存读取数据
* **load (载入)** 将主内存读取到的数据写入工作内存
* **use (使用)** 从工作内存读取数据来计算
* **assign (赋值)** 将计算好的值重新赋值到工作内存中
* **store (存储)** 将工作内存数据写入主内存
* **write (写入)** 将store过去的变量值赋值给主内存中的变量
* **lock (锁定)** 将主内存变量加锁, 标识为线程独占状态
* **unlock (解锁)** 将主内存变量解锁, 解锁后其他线程可以锁定该变量

# 缓存不一致问题
### 总线加锁(性能太低)
cpu从主内存读取数据到高速缓存, 会在总线对这个数据加锁, 这样其它cpu没法去读或写这个数据, 直到这个cpu使用完数据释放锁之后其它CPU才能读取该数据 
### MESI缓存一致性协议
多个cpu从主内存读取同一个数据到各自的高速缓存, 当其中某个CPU修改了缓存里的数据, 该数据会马上同步回主内存, 其它CPU通过**总线嗅探机制**可以感知到 数据的变化从而将自己缓存里的数据失效
