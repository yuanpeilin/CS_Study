# 目录
- [通配符](#通配符)
- [BRE](#bre)
- [PCRE](#pcre)



***************************************************************************************************



# 通配符

Symbol                          | Descriptio
------------------------------- | ----------------------------
`*`                             | 任意长度的字符, 0个或0个以上
`?`                             | 0个或1个字符字符
`+`                             | 1个或1个以上的字符
`[c1-c2]`                       | c1-c2之间的任意单个字符
`[c1,c2,...cn]`                 | 匹配例举出的任意单个字符
`{string1,string2,...string n}` | 匹配任意单个字符串
`{num}`                         | num次匹配
`{num,}`                        | 至少num次匹配
`{num1, num2}`                  | 至少num1次最多num2次匹配
`!`                             | 取反. 与`[]`或`{}`连用
`^`                             | 开始标记, 在集合[]中为否定的意思
`$`                             | 结束标记

# BRE

Symbol     | Description
---------- | ------------------------------
[:alnum:]  | 任意字母和数字(即[a-zA-Z0-9])
[:alpha:]  | 任意字母(同[a-zA-Z])
[:blank:]  | 空格和制表(同[\\t])
[:cntrl:]  | ASCII控制字符(ASCII 0到31和127)
[:digit:]  | 任意数字(同[0-9])
[:graph:]  | 与[:print:]相同，但不包括空格
[:lower:]  | 任意小写字母
[:print:]  | 任意可打印字符
[:punct:]  | 既不在[:alnum:]又不在[:cntrl:]中的任意字符
[:space:]  | 包括空格在内的任意空白字符(同[\\f\\n\\r\\t\\v])
[:upper:]  | 任意大写字母(同[A-Z])
[:xdigit:] | 任意十六进制数字(同[a-fA-F0-9])

```sh
grep '[[:digit:]]' file.txt
```

# PCRE

Symbol | Description
------ | -----------
`\d`   | [1-9]
`\D`   | [^1-9]
`\s`   | [ \\t\\r\\n\\f]
`\S`   | [^ \\t\\r\\n\\f]
`\w`   | [a-zA-Z]
`\W`   | [^a-zA-Z]
