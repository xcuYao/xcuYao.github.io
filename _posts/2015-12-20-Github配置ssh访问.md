---
layout: 		post
title:			"Github配置ssh访问"
date:			2015-12-20
categories:		工具
key: 			10007
---
名词链接:[ssh](http://baike.baidu.com/subview/16184/5909252.htm) [github](http://baike.baidu.com/view/3366456.htm)

**目的**: 在`push pull`的时候 不想每次都输入账号密码验证 就可以通过配置`ssh` 使用公钥加密 私钥解密的方式来验证  
**大致步骤：**
1. 本机生成公钥私钥 
2. 将私钥加入ssh-agent 
3. 将公钥设置到github 
4. 测试结果

**具体步骤**

1. 本机生成公钥私钥
<code>ssh-keygen -t rsa -b 4096 -C "[your-email-address]"</code>

创建成功后 会看到如下结果
![](http://upload-images.jianshu.io/upload_images/605596-ff78b90864f474c0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)  

提示保存位置 直接enter之后私钥公钥会在创建成功后保存在id-rsa和id-rsa.pub文件之中

提示输入密码 确认密码之后  
如果能看到指纹和对应的randomart image 就算成功了

2. 将私钥加入ssh-agent  
```
eval "$(ssh-agent -s)"
```
看到pid说明正在运行时 输入  
```
ssh-add ~/.ssh/id_rsa
```
将`id_rsa`中的私钥加入`ssh-agent`  
看到 如下结果
![](http://upload-images.jianshu.io/upload_images/605596-992f3e20cb8b2169.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
就说明加入成功了  

3. 将公钥设置到github
```
pbcopy < ~/.ssh/id_rsa.pub
```
拷贝公钥到剪贴板(注意空格 换行都要拷贝走)
在`github->Settings->SSH keys->add SSH key`
中加入拷贝好的公钥 点解确定
4. 测试结果
```
ssh -T git@github.com
```
提示
![](http://upload-images.jianshu.io/upload_images/605596-f8929311d66eed93.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
就说明成功了

[github参考教程](https://help.github.com/articles/generating-ssh-keys/)