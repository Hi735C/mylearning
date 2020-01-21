# 正则表达式

export LC_ALL=C

## BRE

字符匹配

. [] [^] [:alnum:] [:alpha:] [:lower:] [:blank:] [:space:] [:cntrl:] [:digit:] [:graph:] [:print:] [:punct:]

匹配次数

. , \?  0-1次  , \ + 1次以上 ,   \ {m,n\ },

位置锚定

^ $ , \ < , \ >

分组

\ ( \ )  \1 引用  \2

## ERE

与BRE区别不大 不需要加\



# grep 

1. -E 
2. -o 
3. -v 只显示匹配到以外的
4. -i 不区分大小写 ignore
5. -n 显示行号
6. -w 按单词匹配
7. -A
8. -B
9. -C
10. -P 支持perl语言的正则
11. -r 递归匹配
12. -l 只显示文件名

```bash
find ./ -type f -name "*.cc" |xargs grep "asiainfo" #xargs 命令传参
```



# sed 流编辑器 取行

**对文件内容的增删改查**    **正则贪婪匹配**

sed 选项 内置命令符号 文件

1. -n 取消命令的默认输出

2. -i  修改文件不输出到终端

   ```
   sed -i a.txt a.txt.bak #修改前先备份为a.txt.bak
   ```

   

3. -e 多次编辑

4. -r 扩展正则

内置命令符

1. s 替换
2. g 全局 global
3. p 打印 print
4. d 删除
5. a 追加
6. i 插入

```shell
#打印2,3行
sed -n '2,3p'  文件
#过滤出xyz 行输出
sed -n '/xyz/p' 文件
#删除含有xyz的行
sed '/xyz/d' 文件
#替换
sed 's#想替换啥#用啥替换#g' 文件
#修改文件 
sed -i 
#第二行后追加xyz
sed '2a xyz ' 文件
#第二行插入
sed '2i asdfasdfasfd\n12345\n12345'文件
```





# awk 老大  处理字符串 取列

过滤 取列 统计计算

awk语法

awk 参数 '条件{动作}' 文件

参数

 -F 指定分隔符

```shell
#打印第一,三列 : 分割
awk -F ":" '{print $1,$3}' 文件
$0 整行
$NF 最后一列    #NF表示的最后一列的数字
$(NF-1) 倒数第二列
$NR 行号        #NR表示行号的数字
awk 'NR=FNR{print FNR,$0}' awk_file awk_file_bak #FNR会把两个文件当成两个文件


#过滤含有root的行
awk '/root/' 文件

#删除含有root的行   [^r]非r ^[^r] 以非r开头 
awk '/^[^r]/' 文件

#过滤出文件中第一列内容匹配root的字符串,把符合的行的最后一列打印输出   ~表示匹配
awk -F ":" '$1~/root/{print $NF}' 文件

#指定多个分割符 :和空格
awk -F "[: ]" 



FS=":" #指定字段分割符号
OFS="-----" #指定输出分隔符

awk 'BEGIN { print 1/2} {print "ok"} END {print over}'  要处理的文件
```

## if

```shell
awk -F: '{ if(表达式){语句;语句;} else {语句} }'
```

## while

```shell
awk -F: '{ while(表达式){语句;语句;语句} }'
```

## for

```shell
awk -F: '{ for(表达式) {语句;语句;} }' 
```

## 数组

