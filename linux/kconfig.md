# 目录



<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->
<!-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = -->



# 基本类型
“bool”表示变量类型。每个配置选项都必须指定类型，类型包括bool、tristate、string、hex和int，其中tristate和string是两种基本的类型，其它类型都基于这两种基本类型。
y表示静态选中，m表示动态选中，n表示不选中
bool: y和n     [ ]
tristate: y、n和m     < >
string: 字符串
int: 数字


--------------------------------------------------------------------------------

1. config：菜单入口
```
config  CONFIG_VALUE
  bool  "this is a config"
  default y
  help
    config help message
```

config 关键字定义新的配置选项

“bool”之后的字符串"this is a config"是提示信息，类型定义后，可以紧跟输入提示
```
# 提示信息的一般格式
prompt 提示字符 [if 依赖表达式]
===================================================================================================
# 下面两种写法等价
bool  "this is a config" 

bool  
promte "this is a config"
```

一个配置选项可以存在任意多个默认值，这种情况下只有第一个被定义的值是可用的。如果用户不设置对应的选项，配置选项的值就是默认值
```
# 默认值格式为
default 值 [if 依赖表达式]
```

依赖关系的格式为: depends  on （或者requires）  <expr>
"depends on" / "requires" 如果定义了多重依赖关系，它们之间用“&&”间隔
依赖关系也可以应用到该菜单中所有的其它选项（同样接受if表达式）
如果依赖的配置项没有选中，那么就当前项也无法选中
若依赖的配置项为模块化 m，当前项也可以选中，但是comment会显示 
```
# 下面是等价的
depends on bar
bool "fool"
default y

bool "fool" if bar
default y if bar
```
```
config CONFIG_VALUE
	bool "this is a config"
	default y
	help
		config help message
  
config QCONFIG_VALUE
	bool "this is qconfig"
	depends on CONFIG_VALUE
comment "module supportt disable"
	depends on !CONFIG_VALUE
 
obj-$(CONFIG_CONFIG_VALUE) += test.o
obj-$(CONFIG_QCONFIG_VALUE) += qtest.o
```




帮助信息的格式为：
```
config .... 
   hellp （或---hellp---）
      开始
      ......
其他命令（缩进小于help的关键字的行是help结束行）
```

2. menu
menu的作用，可以理解成一个目录，menu可以把其中一部分配置项包含到一个menu中，这样有利于配置的分类显示。menu与endmenu是一组指令，必须同时出现。menu和endmenu中包含的部分就是子目录中的配置项
所有处于“menu”和“endmenu”之间的菜单入口都会成为“Network  Device support”的子菜单。而且，所有子菜单选项都会继承父菜单的依赖关系，比如，“Network  Device support”对“NET”的依赖会被加到了配置选项“NETDEVICES”的依赖列表中。
注意，menu后面跟的“Network  Device support”项目仅仅是一个菜单，没有对应真实的配置选项，也不具备3中不同的状态。这是它和config的区别
```
menu "Network Support"
    depends on NET
config NETDEVICES
.....
endmenu
```
```
menu "ypl"
config CONFIG_VALUE
        bool "this is a config"
        default y
        help
                config help message
config QCONFIG_VALUE
        bool "this is qconfig"
        depends on CONFIG_VALUE
comment "module supportt disable"
        depends on !CONFIG_VALUE
endmenu
```




3. menuconfig
menuconfig是一个配置和菜单组成，它从menuconfig关键字行开始，到脚本文件结束行为止，这中间的元素是显示在这个配置菜单的内容
menuconfig有点类似menu，但它是可以配置的。而且从格式上来看，也是有区别的
```
menuconfig TTEST_MC
    bool "menuconfig test"
    default n
配置项或分类菜单
==============================================================================================
# 如果选中了yplMenu，那么if和endif中的内容可以显示。如果没有定义，就只能进入一个空目录
menuconfig VALUE3
 bool "yplMenu"

if VALUE3
config MYUSB
  tristate
  prompt "select it"
  default m
config MYUSB2
  bool "selece USB2"
  default m
  depends on MYUSB
comment "select first"
  depends on !MYUSB
  
endif
```




4. choice
从多个配置选项里面选择一个为y，或者让多个配置选项的值同时为m；选择菜单里面的配置项类型要一样，且只能为bool和tristate类型
```
choice
  prompt "Kernel compression mode"
  default KERNEL_GZIP
  depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO
 
config KERNEL_GZIP
  bool "Gzip"
  depends on HAVE_KERNEL_GZIP
 
config KERNEL_BZIP2
  bool "Bzip2"
  depends on HAVE_KERNEL_BZIP2
...
endchoice
```



5. source
source只是将另外一个Kconfig文件直接复制到当前位置而已。但它的作用也是明显的，可以将这个系统贯穿在一起。
从开始位置arch/arm/Kconfig，来将整个系统都作为配置型，相当于预处理命令里的头文件包含，Kconfig工具主要采用文件包含的方式，来将各级目录下面的所有的Kconfig脚本文件合并成一个Kconfig脚本，然后显示成图形配置界面

6. 注释
在图形界面里面显示一行注释，通常的用法如下
```
comment "TESt is disable"
    depends on !HELLO
```


--------------------------------------------------------------------------------

makefile
需要修改源码目录下的Makefile文件，增加对应编译项目。根据.config文件的 CONFIG_变量 来决定文件的编译方式，如
```
obj-m +=hello.o  //以模块形式编译得到hello.o
Obj-y +=hello.o  //由.c或者.s文件编译得到.o，并连接进内核

# 例如: 
obj-$(CONFIG_ISDN)     += isdn.o
obj-$(CONFIG_ISDN_PPP_BSDCOMP)     += ISDN_BSDCOMP.o
```

=========================================================================================================


```
objects = main.o SelectionSort.o SwapSort.o swap.o
Sorting: $(objects)
gcc $(objects) -o Sorting
...

```



