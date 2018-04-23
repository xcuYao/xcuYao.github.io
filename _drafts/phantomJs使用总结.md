---
layout:				post
title:				"PhantomJS使用总结"
date:				2018-02-04
categories:			爬虫
key:				10004
---

PhantomJS是一个基于webkit的JavaScript API。  
可以简单的理解为一个没有界面的浏览器,所有我们对浏览器的点击操作，全部可以通过调用PhantomJS的API来实现。  
除了访问网站之外 还可以实现截屏、对DOM树操作、与操作系统交互、前端自动化测试等功能。  
<!--more-->

### 快速在Mac上打开
1. 使用npm安装
```
➜  npm install phantomjs -g
```
安装完成后直接在命令行中执行`phantomjs` 可以进入一个与phantomjs交互的命令行环境中  
按下`crtl+c`退出  
执行`which phantomjs`  
可以看到 `phantomjs`被装到了`/Users/yaoning/.nvm/versions/node/v8.5.0/bin/phantomjs`目录下  


2. [官网](http://phantomjs.org/download.html)下载安装包  
解压后 `bin`目录下的phantomjs就是编译好的可执行文件，  
可以直接执行`examples`中的一个例子看下效果    
```
➜  bin pwd
/Users/yaoning/Downloads/phantomjs-2.1.1-macosx/bin
➜  bin ./phantomjs
phantomjs>
➜  bin ./phantomjs ../examples/hello.js
Hello, world!
➜  bin
```

### 开始一个例子
访问 [天眼查](https://www.tianyancha.com) 并将首页渲染成一张图片
```
//导入webpage模块
var page = require('webpage').create();
var address = 'https://www.tianyancha.com';
page.open(address, function (status) {
    if (status !== 'success') {
        console.log('FAIL to load the address');
    } else {
       	// quality为画质 100为最高
        page.render('test.png', {format: 'png', quality: '80'});
    }
    //退出
    phantom.exit();
});

```

### 常用的模块
1. webpage模块  
最主要的模块、提供了与网页交互的绝大部分方法  
引入`require('webpage')`  
eg.  
获取当前页面的Cookie `page.cookies`  
获取页面上的所有文本 `page.plainText`  
设置当前页面窗口大小 `page.viewportSize={width:1920, height:1080}`  
清理cookie `page.clearCookies()`  
监听到收到请求 
```
page.onResourceReceived = function(response) {
	console.log('--- 收到返回的资源');
    console.log('--- ' + JSON.stringify(response));
}
```
所有属性、方法、回调可以在 [这里](http://phantomjs.org/api/webpage/) 找到

2. File System Module
提供了与文件系统的交互

3. 

### Java中调用PhantomJS
```

```

### 结合WebDriver的使用
```
```

### 接收json参数
```
```

### 相关链接


