---
layout:			post
title:			"Jekyll搭建GitPages"
date:			2018-01-15
categories:		工具
key: 			10002
---

[Jekyll](http://jekyllcn.com/)是一个简单的博客形态的静态站点生产机器
借助Jekyll可以将Markdown格式的文章生成静态的html
[GitPages](https://pages.github.com/)是Github提供的个人站点服务  
按照GitPages约定的规则,再结合Jekyll的静态站点生成功能,可以快速的搭建起一个免费、稳定的个人blog  
<!--more-->

### 环境准备
本机环境  
``` shell
sw_vers -productVersion		
#macOS:10.12.6
ruby -v 		
# Ruby:ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]
gem -v		
# gem:2.6.12
node -v		
# node:v8.5.0
python --version		
# Python 2.7.10
```
---

### Jekyll
`gem install jekyll`   
Mac用户需要安装Xcode和`Command-Line Tools`  
找一个合适的目录 执行`jekyll new {blogName}`  
会生成一个`{blogName}`的目录  
结构如下  
![](http://p2je2qbl0.bkt.clouddn.com/WX20180114-182913.png)  
执行`jekyll serve`  
查看`localhost:4000`就可以看到页面了  
jekyll的目录结构和配置可以参考[Jekyll](http://jekyllcn.com/docs/home/)  

---

### GitPages
创建repo `{userName}.github.io`  
将本地的jekyll项目加入git管理 并推送到该repo  
稍等几分钟 访问 `http://{userName}.github.io` 就可以看到页面了   

#### GitPages的一些要求
GitPages的Markdown解析器只支持`kramdown`  
主题支持只有官方的几个主题可选  
代码高亮只支持`rouge`  
所以在本地的`_config.yml`文件中这两项的配置必然是这样的  
这也是为什么你本地OK但是在GitPages上显示不出来的原因  
要使用GitPages,我们就要遵守约定的规则  

```
markdown: kramdown
highlighter: rouge
```

---

### 自定义主题
最快速的方法  
fork 原作者的项目到自己的仓库 并起名字为`{userName}.github.io`  
在原作者的基础上修改  

官方推荐的[方法](https://help.github.com/articles/adding-a-jekyll-theme-to-your-github-pages-site/)    

当然我采用的是第一种方法，简单快速  

---

### 集成评论插件
这里我集成的是[disqus](https://disqus.com/)  
具体步骤可以按照这个[流程](https://disqus.com/features/engage/)  
信息填充ok之后会得到一个shortname  
我使用的这个[主题](https://github.com/kitian616/jekyll-TeXt-theme)已经针对DisQus做了优化  
只需简单配置  
![](http://p2je2qbl0.bkt.clouddn.com/WX20180115-151411.png)  


再在每篇文章开头配置上一个独一无二的key,格式随意,字母数字及`- _ : .` 就ok了  
![](http://p2je2qbl0.bkt.clouddn.com/WX20180115-151639.png)  


*disqus在国内可能会访问的不是很顺畅、不过对于熟练翻墙的程序员来说也还ok* 

---

### 自定义域名
在xxx.github.io这个Repo的Setting页面  
可以配置自己的域名,我的配置如图所示  
 ![](http://p2je2qbl0.bkt.clouddn.com/WX20180115-152045.png)   
  

同样的,dns也需要自己配一下,我使用的是阿里云,配置如下图  
![](http://p2je2qbl0.bkt.clouddn.com/WX20180115-152322.png)  
  

域名解析大约在24小时之内生效  

---

### 新机器环境快速配置
1. 下载源码 git clone <address>
2. 安装jekyll sudo gem install jekyll
3. 安装bundler sudo gem install bundler
4. 安装依赖 bundler install 
5. 启动 执行start.sh

### 参考、资料
当配置遇到问题的时候,最好的方法是看文档想搞明白大致是怎么样实现的  
然后参考别人OK的配置  
[Jekyll](http://jekyllcn.com/docs/home/)  
[rubygems](https://rubygems.org/)   
[gitPages](https://pages.github.com/)  