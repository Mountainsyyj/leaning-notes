# 介绍

1. 基础

2. 实操

3. 定制Javaee 大数据 python

   ## 学习路径

   1. 基本操作命令

   2. 各种配置

   3. 搭建开发环境

   4. shell脚本

   5. 安全设置

   6. 深入了解Linux系统，内核

      

# Linux基础

	## Linux入门

1. 免费、开源、安全、高效、稳定、处理高并发，企业级项目部署到Linux/unix服务器运行

2. 创始人 Linus

3. 吉祥物 企鹅 Tux

4. 主要发行版本

   centos	rethat

   ubuntu

   Suse

   红旗Linux

5. 主要操作系统 windows\ios\android\mac

6. Unix  只针对大型主机或服务器收费     Ken tompsom & Demnis richres

   ​	Richard Stallman 提出GNU计划（Hard ware	Kernal	GNU Shell	FTP/Desktop...）

   ​	Minix

   ​	Linux 	Linus Torvalds

   ​        

## Linux目录结构

一切皆文件

根目录	/

* /bin  (/usr/bin,  /usr/local/bin)  存放着最经常使用的命令
* /dev  管理设备，设备管理器
* /root  超级权限者的用户主目录
* /etc  所有系统管理所需要的配置文件和子目录my.conf
* /home  存放普通用户的主目录
* /lib  系统开机所需要最基本的动态连接共享库，类似于Windows里的DLL文件
* /lost+found 系统非法关机后，会存放一些文件
* /opt 额外安装软件
* /mnt 用户挂载别的文件系统
* /lib64
* /media  光驱，U盘
* /proc 系统内存映射 
* /sys  安装2.6内核中新出现的一个文件系统sysfs
* /srv  sevice缩写,存放一些服务启动后需要提取的数据
* /boot  启动Linux的一些核心文件，包括一些连接文件以及镜像
* /sbin 高权限用户，系统管理员使用的系统管理程序
* /selinux 安全子系统，控制程序只能访问特定文件
* /tmp  临时文件
* /usr 用户应用程序和文件  类似于windows下的program
* /usr/local 安装过后软件存放目录
* /var 日志



## Linux远程登陆

Xshell5

XFtp5  sftp

Linux 开启 sshd 服务 监听22

## Vi & Vim 编辑器

常用模式

1. 正常模式

   使用快捷键

2. 插入/编辑模式

   输入i,I,o,O,a,A,r,R

3. 命令行模式esc

   1. wq
   2. q
   3. q!

   

   快捷键使用

   yy p 复制 ，粘贴到指定位置

   yy5 p  向下复制5行，粘贴

   dd  删除

   5dd 

   查找关键字  / n

   :set nu :set nonu

   G最末行

   gg最首行

   撤销 u

   指定位置 1.行号 2.20 3.shfit+g

## 关机&重启

shutdown

 	1. shutdown -h now  立即关机
 	2. shutdown -h 1  1分钟后关机
 	3. shutdown -r now  立即重启

halt

​	关机

reboot

​	重启

sync

​	同步内存数据

## 登录&注销

一般不使用root用户登录

logout 注销

## 用户管理

用户组

家目录/home/

* 添加用户&指定密码
  * `useradd xm` 默认xm组
  * `useradd -d  /home/trigger xh` 指定目录
  * `passwd xm`  修改密码
  * `useradd -g wudang zwj` 创建用户指定用户组
* 删除用户
  * `userdel xm`  删除用户，保留家目录
  * `userdel -r xh`删除用户，同时删除家目录  

* 查询用户信息
  * `id root`
* 切换用户
  * `su root`用户权限不足提示
  * `exit` 返回原来的用户
* 用户组
  * 增加组
    * `groupadd  wudang`
  * 删除组
    * `groupdel wudang`
  * 修改用户组
    * `usermod -g shaolin zwj`

相关文件

* 用户配置文件 /etc/passwd
  * zwj: x :583:582::/home/xm​:/bin/bash
  * 用户名：口令：用户id：组id：家目录：shell  
* 组配置文件/etc/group
  * 组名：口令：组标志号：组内用户列表
* 口令配置文件 /etc/shadow
  * 登录名：加密口令：最后一次修改时间：最小时间间隔：最大时间间隔：警告时间：不活动时间：失效时间：标志

## 实用指令

### 指令运行级别

0：关机

1：单用户

2：多用户，无网络

3：多用户，有网络

4：保留

5：图形界面

6：重启

/etc/inittab

`init 3`切换运行级别

找回root密码？？

* 进入单用户模式（root不需要密码）
* 修改root密

### 帮助指令

* man
  * `man ls`
* help
  * `help cd`

### 文件目录类

* `pwd`
* `ls`
  * a  显示隐藏目录
  * l  以列表的形式显示
* `cd`
  * ~ 家目录
  * .. 上一级目录
* `mkdir` -p 创建多级目录
* `rmdir` 
  * 非空目录  `rm -rf `
* `touch`  一次性创建多个文件
* `cp` \[source\]\[des\]
  * `cp aaa.txt bbb/` 当前目录aaa.txt 拷贝到当前目录 bbb下
  * `cp -r  test/ zwj/` 递归拷贝
  * `\cp `  目标目录下相同文件，强制覆盖不会提示
* `rm `
  * r  递归删除
  * f 强制删除不提示
* `mv`
  * 移动   `mv aaa.txt /home/`
  * 重命名  `mv aaa.txt bbb.txt`
* `cat`  只读方式查看文件
  * `cat -n xx | more `  n带行号
* `more`
  * space 页
  * enter  行
  * ctrl +b 返回上一屏
  * ctrl +f  向下翻一行
  * q  离开
  * = 输出当前行号
  * :f  输出当前文件名和当前行的行号
* `less`  大型文件查看
  * space
  * pagedown
  * pageup
  * /   向下搜寻  n:向下  N:向上
  * ?  向上搜寻 n 向上  N向下
  * q 离开
* \>输出重定向 \>>追加
  * \>覆盖原来文件内容
  * \>>末尾追加
  * `ls -l > a.txt`
  * `ls -l >> b.txt`
* `echo `
  * `echo $PATH` 输出环境变量
  * `echo "hello world!"`
* `head -n 5 a.txt`  前5行
* `tail -n a.txt` 后5行
* `tail -f a.txt 实时监控文件更新`
* `ln ` 软链接
  * `ln -s  /home/root aaa`        `cd aaa`  实际进入root  pwd仍然是aaa(快捷方式)
  * `rm -rf aaa`
* `history` 查看执行过的命令  `！178`   执行编号为178指令

### 时间日期类

* `data` 
  * `data "+%Y %m %d %H:%M:%s"`  显示时间
  * `date -s "2019-04-13 10:50:50"`  设置时间
* `cal`  查看日历
  * `cal 2020`

### 搜索

* find
  * `find /home -name hello.txt`   查找范围/home -name文件名
  * `find /home -user yyj` -user 用户名
  * `find / -size +20M/-20M/20M`  size>20<20=20
* locate 快速定位文件路劲
  * `updatedb`
  * `locate hello.txt`
* grep  & |   文件内容搜索
  * `cat hello.txt | grep -n -i yes`  

### 压缩&解压缩

* gzip  gunzip
  * `gzip hello.txt`  压缩后不会保留原文件
  * `gunzip hello.txt.gz`
* zip/unzip
  * `zip -r mypa.zip /home/ `  r递归压缩
  * `unzip -d /root mypa.zip`  d指定解压目录
* tar    .tar.gz
  * c 产生.tar打包文件
  * v 显示详细信息
  * f 指定压缩后文件名
  * z 打包同时压缩
  * x  解包.tar文件
  * `tar -zcvf a.tar.gz a.txt b.txt`
  * `tar -zcvf home.tar.gz /home/`
  * `tar -zxvf a.tar.gz`
  * `tar -zxvf home.tar.gz -C /opt`

### 组管理&权限管理

组管理

* `ls -alh` 查看文件所有者
* `chown tom app.txt`  改变文件所有者（未改变所有组）
* `chgrp police app.txt` 改变文件所有组
* `usermod  -g  agroup  tom`
* `usermod -d  目录名 用户名 ` 改变用户登录的初始目录

权限

文件类型- 普通文件 d 目录  l 链接 c 字符设备  b 块文件，硬盘

文件所有者权限 rwx 4

文件所在组  rwx 2

其他组   rwx 1

1  文件：硬连接数或 目录：子目录数

root  用户

root  组

1213 文件大小，文件夹，显示4096字节

Feb 2 09:39  最后修改日期

abc  文件名

* `chmod`  修改文件，目录权限
  * `chmod u=rwx,g=rx,o=x`
  * `chmod o+x/-x`
  * `chmod u=rwx,g=rx,o=rx abc`
  * `chmod u-x,g+w abc`
  * `chmod a+r abc`
  * `chmod 755 abc`  
* `chown` 修改文件所有组(所有文件)
  * `chown -R tom /home`
  * `chgrp -R agroup /test`

### 权限实践

police, bandit

jack,jerry:警察

xh,xq:土匪

创建组

* `groupadd police`
* `groupadd bandit`

创建用户

* `useradd -g police jack`
* `useradd -g police jerry`
* `useradd -g badit xh`
* `useradd -g badit xq`
* `passwd jack`
* `passwd jerry`
* `passwd xh`
* `passwd xq`

jack 创建一个文件，自己可以读写，本组人可以读，其他组没有任何权限

* `su jack`
* `touch a.txt`
* `chmod 640 a.txt`

jack修改该文件，让其他组人可以读，本组人可以读写

* `chmod o=r,g=rw a.txt`

xh 投靠警察，看看是否可以读写

* `su root`
* `usermod -g police xh`

### 定时任务调度

mysql数据库备份

cront

* `crontab -e `		\*/1\*\**** 