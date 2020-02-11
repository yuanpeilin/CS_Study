# 目录
* [**GCC**](#user-content-gcc)
	* [基本用法](#user-content-基本用法-顶部)
	* [选项](#user-content-选项-顶部)
	* [文件后缀名](#user-content-文件后缀名-顶部)
	* [编译流程](#user-content-编译流程-顶部)
* [**Make**](#user-content-make)
	* [定义](#user-content-定义-顶部)
	* [工作流程](#user-content-工作流程-顶部)
	* [选项](#user-content-选项-顶部-1)
* [**Make File**](#user-content-makefile)
	* [书写规则](#user-content-书写规则-顶部)
	* [规则](#user-content-规则-顶部)
	* [执行流程](#user-content-执行流程-顶部)
	* [伪目标](#user-content-伪目标-顶部)
	* [实例](#user-content-实例-顶部)
	* [变量](#user-content-变量-顶部)
	* [自定义变量](#user-content-自定义变量-顶部)
	* [预定义变量](#user-content-预定义变量-顶部)
	* [隐含规则](#user-content-隐含规则-顶部)
	* [模式规则](#user-content-模式规则-顶部)
	* [后缀规则](#user-content-后缀规则-顶部)
	* [使用函数](#user-content-使用函数-顶部)

****************************************************************************************************************

# GCC

### 基本用法 [`顶部`](#user-content-目录)
* 先编写一个hello.c
```c
#include <stdio.h>
#define STRING "hello world\n"

int main(){
    printf(STRING);
}
```
* 编译`gcc hello.c`生成可执行文件a.out
* 可以用`gcc hello.c  -o hello`生hello可执行文件
* 执行`./a.out`

### 选项 [`顶部`](#user-content-目录)
选项 | 含义描述
:-- | :--
-o filename | 指定输出文件名, 这一选项不是必须的. 如果filename没有指定, 缺省文件名是a.out
-E          | 只**预编译**, **不编译和汇编和链接**, 生成文件 **.i**
-S          | 只**预编译和编译**, **不汇编和链接**, 生成汇编代码 **.s**
-c          | 只**预编译和编译和汇编**, **不链接**, 生成目标文件 **.o**
-g          | 在生成的可执行程序中包含标准调试信息
-v          | 打印编译器内部编译各过程的命令行信息和编译器的版本号
-I dir      | 在头文件的搜索路径列表中添加dir目录
-L dir      | 在库文件的搜索路径列表中添加dir目录
-wall       | 在发生警告时取消编译操作, 即将警告看作是错误
-w          | 禁止所有的报警

### 文件后缀名 [`顶部`](#user-content-目录)
文件后缀名 | 文件类型约定
:-- | :--
.c | C语言源代码文件
.i | 经预编译过的C源代码文件
.s | 汇编语言源代码文件
.o | 编译后的目标文件
.C .cc .cpp | C++源代码文件
.ii | 经预处理过的C++源代码文件
.S | 经过预编译的汇编语言源代码文件

### 编译流程 [`顶部`](#user-content-目录)
* 一般来说, 无论是C还是C++, 首先要把源文件编译成**目标文件**, 即**Object File**, 在Windows下是 **.obj**文件, UNIX下是 **.o**文件, 这个动作叫做**编译(compile)**. 然后再把大量的Object File合成可执行文件, 这个动作叫作**链接(link)**
	* 编译时, 编译器需要的是语法的正确, 函数与变量的声明的正确
	* 链接时, 通常是你需要告诉编译器头文件的所在位置, 只要所有的语法正确, 编译器就可以编译出中间目标文件. 一般来说, 每个源文件都应该对应于一个目标文件
* 在大多数时候, 由于源文件太多, 编译生成的中间目标文件太多, 而在链接时需要明显地指出中间目标文件名, 这对于编译很不方便. 所以, 我们要给中间目标文件打个包, 在Windows下这种包叫**库文件(Library File)**, 也就是 **.lib**文件, 在UNIX下, 是 **Archive File**, 也就是 **.a**文件. 

1. **预编译(pre-processing)**  
	* 在预处理阶段, 输入C语言的源文件, 通常为 **\*.c** , 它们通常带有.h之类头文件的包含文件. 这个阶段主要处理源文件中的#ifdef、# include和# define等预处理命令.  
	* 该阶段会生成一个中间文件 **\*.i** ,可以使用 **-E** 参数让gcc在预处理结束后停止编译过程, 预编译: **`gcc -E hello.c -o hello.i`** 

2. **编译(compiling)**  
	* 在编译阶段, gcc把预处理后的结果编译成汇编或者目标模块. 输入的是中间文件 **\*.i** , 编译后生成汇编语言文件 **\*.s**
	* 这个阶段对应的gcc命令如下所示: **`gcc -S hello.i -o hello.s`**

3. **汇编(assembly)**  
	* 在汇编阶段, 编译器把编译出来的结果汇编成具体CPU上的目标代码模块. 输入汇编文件 **\*.s** , 输出机器语言 **\*.o**
	* 这个阶段可以通过使用 **-c** 参数来完成: **`gcc -c hello.s -o hello.o`**

4. **链接(linking)**  
	* 在链接阶段把多个目标代码模块连接生成一个大的目标模块. 输入机器代码 **\*.o** , 汇集成一个可执行的二进制代码文件
	* 这一步骤可以利用以下代码: **`gcc hello.o -o hello`**

****************************************************************************************************************

# Make

### 定义 [`顶部`](#user-content-目录)
* make是一个解释Makefile文件中指令的命令工具, 其最基本的功能就是通过Makefile文件来描述源程序之间的相互关系并自动维护编译工作, 它会告知系统以何种方式编译和链接程序. 一旦正确完成Makefile文件, 剩下的工作就只是在linux终端下输入make这样的一个命令, 就可以自动完成所有编译任务, 并且生成目标程序 
* make工具管理项目的过程是从最底层开始的, 是一个逆序遍历的过程. 任何一个源文件的改变都会导致重新编译、链接生成可执行程序, 使用者不需要关心哪个程序改变, 或者依赖哪个文件, make工具会自动完成程序的重新编译和链接工作

### 工作流程 [`顶部`](#user-content-目录)
1. 查找当前目录下的Makefile文件 
2. 初始化文件中的变量
3. 分析Makefile中所有的规则
4. 为所有目标文件创建依赖关系
5. 根据依赖关系, 决定哪些目标文件要重新生成
6. 执行生成命令 
 
### 选项 [`顶部`](#user-content-目录)
make        | Make [选项] [宏定义] [目标文件]
:--         | :--
-f file     | 指定Makefile的文件名
-n          | 打印出所有执行命令, 但实际上并不执行这些命令
-s          | 在执行时不打印命令名
-w          | 如果在make执行时要改变目录, 则打印当前的执行目录
-d          | 打印调试信息
-I dir_name | 指定所用Makefile所在目录
-h          | Help文档, 显示makefile的help信息
目标文件   | 目标文件对于make来说也是一个可选项, 如果省略参数target, make就将生成Makefile文件中定义的第一个目标文件

****************************************************************************************************************

# MakeFile

### 书写规则 [`顶部`](#user-content-目录)
Makefile文件由一系列 **规则(rules)** 构成. 每条规则的形式如下
```make
# notes
target: prerequisites...
<tab> command
...
```
* **`target(目标)`** 可以是一个**object file(目标文件)**, 也可以是一个**可执行文件**, 还可以是一个**伪目标**
* **`prerequisites(前置条件)`** 生成该target所**依赖**的文件或target
* **`tab`** 第二行必须由一个tab键起首, 后面跟着commands
* **`command`** 该target要执行的shell命令. 可以有多个command, 每个command单独一行

### 规则 [`顶部`](#user-content-目录)
* make会比较targets文件和prerequisites文件的修改日期, 如果prerequisites文件的日期有一个以上的文件要比targets文件的日期要新, 或者target不存在的话, 那么, make就会执行后续定义的命令

### 执行流程 [`顶部`](#user-content-目录)
* make会在当前目录下找名字叫"Makefile"或"makefile"的文件
* 如果找到, 它会找文件中的第一个目标文件(target), 在下面的例子中, 他会找到"Sorting"这个文件, 并把这个文件作为最终的目标文件
* 如果Sorting文件不存在, 或是Sorting所依赖的后面的.o文件的文件修改时间要比Sorting这个文件新, 那么, 它就会执行后面所定义的命令来生成Sorting这个文件
* 如果Sorting所依赖的.o文件也不存在, 那么make会在当前文件中找目标为.o文件的依赖性, 如果找到则再根据那一个规则生成.o文件
* .o文件依赖的.c文件和.h文件是存在的, 于是make会生成.o文件, 然后再用.o文件生成make的终极任务, 也就是执行文件Sorting

### 伪目标 [`顶部`](#user-content-目录)
* **.PHONY**表示 clean 是一个"伪目标", 而在rm命令前面加了一个小减号的意思就是, 也许某些文件出现问题, 但不要管, 继续做后面的事
* 当使用`make clean`命令来清理文件时, 如果目录中出现了"clean"文件, 那么规则就失效了, 因为没有依赖文件, 文件"clean"始终是最新的, 命令永远不会执行
* 使用.PHONY来指明目标后, make会知道目标并非是由其它文件生成的实际文件
```make
.PHONY : clean
clean :
	-rm *.o Sorting
```

### 示例 [`顶部`](#user-content-目录)
* 在这个makefile中, **target**包含执行文件Sorting和中间目标文件 \*.o 
* **prerequisites**就是冒号后面的那些.c文件和.h文件
* 每一个.o文件都有一组依赖文件, 而这些.o文件又是执行文件Sorting的依赖文件. 依赖关系的实质就是说明了目标文件是由哪些文件生成的
* 在定义好依赖关系后, 后续的那一行定义了如何生成目标文件的操作系统命令, 一定要以一个Tab键作为开头执行其后所定义的命令, 要执行其后的命令, 就要在make命令后明显得指出这个label的名字
* 通常把第一个目标设置为all
```make
all: Sorting

Sorting: main.o SelectionSort.o SwapSort.o swap.o
	gcc main.o SelectionSort.o SwapSort.o swap.o -o Sorting
main.o: main.c SelectionSort.h SwapSort.h
	gcc -c main.c -o main.o
SelectionSort.o: SelectionSort.c swap.h
	gcc -c SelectionSort.c -o SelectionSort.o
SwapSort.o: SwapSort.c swap.h
	gcc -c SwapSort.c -o SwapSort.o
swap.o: swap.c
	gcc -c swap.c -o swap.o
clean:
	rm -f *.o
	rm -f Sorting
```

### 变量 [`顶部`](#user-content-目录)
* 声明一个变量比如叫objects, 那么我们就可以很方便地在makefile中以 **$(objects)** 的方式来使用这个变量
```make
objects = main.o SelectionSort.o SwapSort.o swap.o

Sorting: $(objects)
	gcc $(objects) -o Sorting
...
```

### 自动化变量 [`顶部`](#user-content-目录)
* **`$@`** 当前目标的完整名称
* **`$<`** 当前目标第一个依赖文件的名称
* **`$^`** 当前目标所有的依赖文件, 以空格分开, 不包含重复文件
* **`$?`** 所有比目标新的依赖文件的集合, 以空格分开
* **`$%`** 当目标是归档成员时, 表示目标的归档成员名. 例如, 如果一个目标是foo.a(bar.o), 那么, $%就是bar.o, $@就是foo.a, 目标不是归档成员时其值为空
* **`$+`** 类似$^ , 也是所有依赖文件的集合, 但**不去除重复**的依赖目标. 主要用于链接命令, 有意义的是以特定顺序重复库文件名
* **`$*`** 一般为不包含扩展名的目标文件名称, 对于 foo.c 其值为foo
```make
objects = main.o SelectionSort.o SwapSort.o swap.o
Sorting: $(objects)
	# gcc main.o SelectionSort.o SwapSort.o swap.o -o Sorting
	gcc $(objects) -o $@
main.o: main.c SelectionSort.h SwapSort.h
	# gcc -c main.c -o main.o
	gcc -c $< -o $@
SelectionSort.o: SelectionSort.c swap.h
	# gcc -c SelectionSort.c -o SelectionSort.o
	gcc -c $< -o $@
SwapSort.o: SwapSort.c swap.h
	# gcc -c SwapSort.c -o SwapSort.o
	gcc -c $< -o $@
swap.o: swap.c
	# gcc -c swap.c -o swap.o
	gcc -c $^ -o $@
clean:
	${RM} *.o
	rm -f Sorting
```

### 预定义变量 [`顶部`](#user-content-目录)
* **AR** 函数库打包程序. 默认值是 ar
* **ARFLAGS** 函数库打包程序AR命令的参数. 默认值是 rv

<br>

* **AS** 汇编语言编译程序. 默认值是 as
* **ASFLAGS** 汇编语言编译器参数. 默认值为空, 下同

<br>

* **CC** C语言编译程序. 默认值是 cc
* **CFLAGS** C语言编译器参数

<br>

* **CXX** C++语言编译程序. 默认值是 g++
* **CXXFLAGS** C++语言编译器参数

<br>

* **CPP** C程序的预处理器. 默认值是 $(CC) –E
* **CPPFLAGS** C预处理器参数

<br>

* **RM** 删除文件命令. 默认值是 rm –f
```make
clean:
	${RM} *.o
```

### 隐含规则 [`顶部`](#user-content-目录)
* 比如.c文件编译成.o文件这一规则, make看到一个.o文件, 它就会自动的把.c文件加在依赖关系中, 如之前的swap.o: swap.c等就可以省略
```make
Sorting: main.o SelectionSort.o SwapSort.o swap.o
	gcc $^ -o $@
clean:
	${RM} *.o
	rm -f Sorting

# main.o: main.c SelectionSort.h SwapSort.h
# 	 gcc -c $< -o $@
# SelectionSort.o: SelectionSort.c swap.h
# 	 gcc -c $< -o $@
# SwapSort.o: SwapSort.c swap.h
# 	 gcc -c $< -o $@
# swap.o: swap.c
#  	 gcc -c $^ -o $@
```
* 对于编译C程序的隐含规则: n.o的目标的依赖目标会自动推导为n.c , 并且其生成命令是 **`$(CC) –c $(CPPFLAGS) $(CFLAGS) `**
* 对于链接Object文件的隐含规则: n目标依赖于n.o, 通过运行C的编译器来运行链接程序生成(一般是 ld),  其生成命令是: **`$(CC) $(LDFLAGS) <n>.o $(LOADLIBES) $(LDLIBS)`**

### 模式规则 [`顶部`](#user-content-目录)
* 一个模式规则就好像一个一般的规则, 只是在规则中, 目标的定义需要有 % 字符. % 的意思是表示一个或多个任意字符
* 在依赖目标中同样可以使用 % ,  只是依赖目标中的 % 的取值, 取决于其目标
* 例如有一个模式规则为: `%.o : %.c`, 其其含义是, 指出了怎么从所有的 .c 文件生成相应的 .o 文件的规则, 如果要生成的目标是 a.o b.o , 那么 %.c 就是 a.c b.c
* 在模式规则中, 目标可能会是多个的, 如果有模式匹配出多个目标, make就会产生所有的模式目标
```make
Sorting: main.o SelectionSort.o SwapSort.o swap.o
	gcc $^ -o $@
%.o:%.c
	gcc -c $< -o $@
clean:
	${RM} *.o
	rm -f Sorting
```

### 后缀规则 [`顶部`](#user-content-目录)
* 后缀规则是一个比较老式的定义隐含规则的方法. 后缀规则会被模式规则逐步地取代, 因为模式规则更强更清晰.  为了和老版本的makefile兼容, GNU make同样兼容于这些东西
* 后缀规则有两种方式: "双后缀"和"单后缀"
	* **双后缀**规则定义了一对后缀: 目标文件的后缀和依赖目标(源文件)的后缀, 如 .c.o 相当于 %o : %c
	* **单后缀**规则只定义一个后缀, 也就是依赖目标文件的后缀, 如 .c 相当于 % : %.c
* 后缀规则不允许任何的依赖文件, 如果有依赖文件的话, 那就不是后缀规则, 比如: .c.o: swap.h
```make
Sorting: main.o SelectionSort.o SwapSort.o swap.o
	gcc $^ -o $@
.c.o:
	gcc -c $< -o $@
clean:
	${RM} *.o
	rm -f Sorting
```

### 使用函数 [`顶部`](#user-content-目录)
* 在makefile中可以使用函数来处理变量, 从而让我们的命令或是规则更加灵活, 函数调用后, 函数的返回值可以当做变量来使用
* 函数调用, 很像变量的使用, 也是以 $ 来标识的, 其语法为 **`${function arguments}`** 或者 **`$(function arguments)`**
* function 就是函数名, arguments 为函数的参数, 参数间以逗号 , 分隔, 而函数名和参数之间以"空格"分隔
* 函数中的参数可以使用变量, 为了风格的统一, 函数和变量的括号最好一样, 比如: `$(subst a,b,$(x)) `
* 例如字符串处理函数subst
	* **`$(subst <from>,<to>,<text>)`** 把字串text中的from字符串替换成to, 返回被替换过后的字符串. `$(subst Hunan,Hunnu,Do you like Hunan ?)`把 `Do you like Hunan ?` 中的 `Hunan` 替换成 `Hunnu` , 返回结果是 `Do you like Hunnu ?`
