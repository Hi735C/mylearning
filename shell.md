# shell

## 基本变量参数

```shell
#!/bin/bash
echo "当前shell脚本的文件名    $0"
echo "当前shell脚本的第一个参数 $1"
echo "当前shell脚本的第二个参数 $2"
echo "当前shell脚本的第三个参数 $3"
echo "所有传递的位置参数是:     $*"    #" $*" 所有参数为同一个字符串输出
echo "所有传递的位置参数是:     $@"    #" $@" 每个参数作为一个字符串输出
echo "总共传递的参数个数是:     $#"
echo "当前程序运行的PID是:      $$"
echo "上一个命令执行的返回结果是: $?"

IFS=: #冒号做分隔符


#$(command)
$(ls)
$(($(date +%Y)+1))

#读入变量
read -p "提示信息" var
echo "你输入的变量是:" $var

${变量#匹配规则} #从头匹配,最短删除
${变量##匹配规则} #从头匹配,最长删除
${变量%匹配规则} #从尾匹配,最短删除
${变量%%匹配规则}
${变量/旧字符串/新字符串} #替换 只替换一个
${变量//旧字符串/新字符串}#替换 全部替换

```

## 变量运算

``` shell
#整数运算
expr 
$(()) 
$[]  


+
-
*
/
%

expr $num1 + $num2
$(( $num1　+ $num2 ))
$[ $num1 + $num2 ]
```



## if

```shell
if[];then
	echo "ok"
fi



if[];then
	echo "ok"
  else
  	echo "no"
fi



if[];then
	echo 
  elif[];then
  	echo
  else
fi
```

### if文件比较

1. -e 如果文件或目录存在 为真    [ -e file ]
2. -s 如果文件存在且至少有一个字符则为真 [ -s file ]
3. -d 如果存在文件且为目录
4. -f 如果存在文件且为普通文件
5. -r 文件存在且可读
6. -w 文件存在且可写
7. -x 文件存在且可执行

### if整数比较

1. -ne     不等于
2. **-eq**      等于
3. -gt      大于
4. -lt        小于
5. -ge      大于等于
6. -le       小于等于

### if字符比较

字符串

1. ==               等于
2. !=                不相等
3. -z                 字符串长度为零        无内容
4. -n                 字符串长度不为空    有内容
5. str1 > str2   str1 大于 str2
6. str1 < str2    str1 小于 str2

多整数比对

1. -a 并且
2. -o 或者

### **if正则比对**   [[  正则表达式  ]]

1. [[    &&    ]]
2. [[  ||  ]]

## for

```shell
for i in 1 2 3 4
do
	echo $i 
done
```



## case

```shell
case 变量 in
变量 1 )
	命令序列1;;
变量 2 )
	命令序列2;;
变量 3 )	
	命令序列3;;
     *)
	无匹配后的命令
esac
```

## while

```shell
while 测试条件
do
	循环体
done


while read line
do 
	echo $line
done<user.txt
```

## 内置跳出循环

1. exit 退出程序
2. break 跳出本循环
3. continue 跳出本次循环

## 函数和数组

### function

1. 定义

   ```shell
   function fun01{
   	echo 
   }
   
   
   fun02(){
   
   }
   ```

   

2. 调用

   1. 先定义
   2. 后调用

3. 传参 (注意区分函数参数和脚本参数)

   1. $1 一个参数
   2. $* 多个参数

4. 返回值



### Array

### 普通数组

```shell
arry=(tom jak alice)

#查看普通数组

declare -a

#访问数组中的元数
echo ${arry[0]}
#访问所有的
echo ${arry[@]}
#取出索引
echo ${!arry[@]}
#统计数组元数个数
echo ${#arry[@]}
```

![1579510961496](C:\Users\hi yang\AppData\Roaming\Typora\typora-user-images\1579510961496.png)

### 关联数组

```shell
#声明数组
declare -A info
#赋值
info=( [name]=bgx [age]=18 [skill]=linux)
#查看
declare -A

echo ${info[name]}
echo ${info[@]}     #查看所有
echo ${!info[@]}     #索引
echo ${#info[@]}     #个数
```



### 数组遍历循环

