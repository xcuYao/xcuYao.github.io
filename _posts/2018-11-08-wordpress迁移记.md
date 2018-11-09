---
layout: 		post
title:		    "wordpress迁移记"
date:			2018-11-08
categories:		开发
key: 			10024
---

## 写在前边
因为帮朋友做wordpress的搬家   
所以记录下wordpress在linux上的安装、配置、迁移、域名解析、https开启的一系列步骤；方便查漏补缺，以备不时之需。  
安装、启动命令最好在提权到root用户进行  
提权命令`sudo -i`


## LAMP安装
LAMP是Linux、Apache、Mysql、PHP的统一简称，是wordpress安装、运行的必备环境。
### Linux
使用的是腾讯云的云服务器1核2G的学习机，安装成功后，将在AWS一个配置较好的机器上再来一遍。  
CentOS Linux release 7.2.1511  
如何查看？  
redhat、centos系统使用`cat /etc/redhat-release`命令查看；  
或者使用`lsb_release -a`命令查看，该命令适用于所有遵守LSB规范的Linux；  
若命令不存在，可以使用`yum install redhat-lsb -y`来安装；  
此外`uname`、可以输出部分系统信息，具体可以使用`uname --help`来查看；  

### Apache
```
// 安装
yum install httpd
// 启动
systemctl start httpd.service
// 启动2
service httpd start
```
systemctl 方式启动比较快、centos7之后提供  
### Mysql
```
// 安装
yum install mariadb-server mariadb  
// 启动
systemctl start mariadb  
// 配置安全向导
mysql_secure_installation
// 跟随系统启动
systemctl enable mariadb.service
```
Mysql配置的内容可以[戳这里](http://yaoning.me/%E5%BC%80%E5%8F%91/2018/07/11/mysql%E5%A4%87%E5%BF%98%E5%BD%95.html)  
### PHP
```
// 安装
yum install php php-mysql
// 重启Apache服务
systemctl restart httpd.service
```

## wordpress安装
wordpress是最流行的建站工具、由世界上最好的语言PHP编写  
### Mysql配置数据库
```
// 登陆mysql
mysql -u root -p
// 创建wordpress库
create database wordpress;
// 创建用户
create user wp_user@localhost identified by '123456';
// 赋予权限
grant all privileges on wordpress.* to wp_user@localhost identified by '123456';
// 刷新
flush privileges;
```
### wordpress
```
// wordpress依赖的一个模块
yum install php-gd
// 重启apache
service httpd restart
// 下载wordpress最新版本
wget http://wordpress.org/latest.tar.gz
// 解压
tar xzvf latest.tar.gz
// 通过rsync转移文件到apache目录 并保留权限
rsync -avP ~/wordpress/ /var/www/html/
// 创建wordpress的上传目录
/var/www/html/wp-content/uploads
// 给apache组加权限
chown -R apache:apache /var/www/html/*
```
### 修改wordpress配置
```
// 进入server目录
cd /var/www/html
// 拷贝示例配置
cp wp-config-sample.php wp-config.php
// 编辑wp-config.php 搜索 DB_NAME 配置改为如下
define('DB_NAME', 'wordpress');
/** MySQL database username */
define('DB_USER', 'wp_user');
/** MySQL database password */
define('DB_PASSWORD', '123456');
```
### 手动完成配置
访问你的公网IP、选择语言，设置用户名密码，完成配置  
再次访问IP，可以正常打开wordpress博客首页就说明成功了  

## 整站迁移
推荐使用[All-in-One WP Migration](https://wordpress.org/plugins/all-in-one-wp-migration/) 这个插件  
但由于PHP对文件上传大小有限制、可以这样修改  
打开 /etc/php.ini 修改如下项 允许上传文件、post数据最大为1G
```
upload_max_filesize=1024M 
post_max_size=1024M
```
改完后 重启服务，修改插件限制的方法在这里  
/var/www/html/wp-content/plugins/all-in-one-wp-migration/constants.php 
```
define( 'AI1WM_MAX_FILE_SIZE', 4294967296 * 10 );
```
在wordpress后台安装好插件后、点一点、可以将整站备份下来、打开新站点倒入就好了  

## 配置域名解析及HTTPS
域名解析很简单、在域名服务提供商那里将你的域名解析到服务器公网IP就好了  
配置HTTPS就有些麻烦了  
首先购买SSL证书之后，会提供给你三个文件 以localhost为例  
localhost.crt 是服务器证书 包含了你的公钥、持有者信息、有效期等内容
localhost.key 是服务器私钥 不要泄漏 可以解密公钥加密的内容
server-chain.crt 是证书链 由CA机构来确保公钥的可靠性、防止中间人攻击  

安装ssl模块
```
yum install -y mod_ssl
```
安装完毕后在/etc/httpd/conf.d/ssl.conf 可以看到一些配置
```
SSLCertificateFile /etc/pki/tls/certs/localhost.crt
SSLCertificateKeyFile /etc/pki/tls/private/localhost.key
SSLCertificateChainFile /etc/pki/tls/certs/server-chain.crt
```
将证书上传到对应的目录下即可完成配置 

上传可以使用rz、sz命令  
```
yum install lrzsz
```

另外 验证证书一致性可以使用如下命令  
```
openssl x509 -noout -modulus -in localhost.crt | openssl md5
openssl rsa -noout -modulus -in localhost.key | openssl md5
```
md5值一致即为正确  

查看log  
/var/log/httpd 目录下可以查看

以上配置完毕之后，在wordpress后台将我们的域名设置上就OK了   
记得配置https之后 域名前要加https


## 一些链接  
[sudo命令](http://www.runoob.com/linux/linux-comm-sudo.html)  
[init,service和systemctl的区别](https://blog.csdn.net/lineuman/article/details/52578399)  
[那些证书相关的玩意儿](https://www.cnblogs.com/guogangj/p/4118605.html)  
[数字签名是什么](http://www.ruanyifeng.com/blog/2011/08/what_is_a_digital_signature.html)  