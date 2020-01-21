# linux基础(centos7)

## 系统安装后要做的事情

1. 设置系统时钟date/clock

   ```shell
   date  #当前系统时钟
   clock #当前主板时钟
   date -s '2008-05-23 01:01:01' + '%F %T' #2008-05-23 01:01:01为将要设定的时间
   
   clock -w #主板时钟与系统时钟同步
   clock -s #系统时钟与主板时钟同步
   ```

2. 设置ntp(网络时钟同步)

   ```shell
   rpm -qa | grep ntp #查看是否安装有ntp服务
   yum install ntp #安装ntp服务
   ntpserver server_address #单次同步
   clock -w
   #配置文件地址
   /etc/ntp/ntp.conf
   server server_address
   ```

3. 关闭selinux

   ```shell
   #配置文件地址
   /etc/selinux/config
   #enforcing 开启
   #permissive 提醒
   #disable 关闭
   ```

4. ssh登陆设置

   ``` shell
   /etc/sudoers   #sudo命令配置文件 在禁用root账户登陆后允许部分账户使用sudo命令提升权限
   <user list><host list>=<operator list><tag list><command list>
   Iiveylinux  ALL=(ALL ) NOPASSWD:ALL
   
   cp /etc/ssh/sshd_config /etc/ssh/sshd_config_bak #备份
   vim etc/ssh/sshd_config
   
   useDNS no #关闭dns反查 加快连接速度
   GSSAPIAuthentication no #关闭GSSAPI验证
   PermitRootLogin no #禁用root账号登陆
   ```

   

5. yum源配置

   ```shell
   /etc/yum.repos.d/*.repo #配置文件
   [local]   #自定义源名称
   name=cdrom     
   baseurl=file:///misc/cd #repo源地址
   gpgkey=file:///misc/cd/RPM-GPG-KEY-CentOS-7 #publickey 路径
   enabled = 0 #启用该源 0|1 不启用该源
   
   Epel      https://fedoraporject.org/wiki/EPEL
   repoforge https://repoforge.org/use/
   
   
   ```

   

6. 如果关机或者重启服务器的话

   ```shell
   sync #将内存中的数据同步到磁盘
   poweroff | shutdown -h now	
   ```

   

7. 

   ```shell
   
   ```

# linux网络相关

# linux文件系统相关

# shell编程

vim name.sh

chmod +x name.sh    #加执行权限



配置.vimrc 可以快速生成开头

## 格式

### 开头

```shell
#!/bin/bash
#!/usr/bin/python
#!/usr/bin/perl
#Author:huyang
#Date:2020-01-15
#Version:1.0
#Description:
#License:
echo"hello world"
```

### 脚本检查

bash -n 检查语法错误

bash -x 调试检查

### 变量

```shell
name="hostname" #赋值
$name           #引用
```

