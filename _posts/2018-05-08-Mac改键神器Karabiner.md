---
layout: 		post
title:			"Mac改键神器Karabiner"
date:			2018-05-08
categories:		系统
key: 			10015
---

### Karabiner介绍
>Karabiner (KeyRemap4MacBook) is a powerful utility for keyboard customization  

Mac上自带的改键工具只能修改部分修饰键  
如将Option键改为Commend键  
但是使用外接键盘、尤其是机械键盘的话,想改键就麻烦了。  
所幸,我们拥有`Karabiner`这款改键神器  

### 安装
macOS 10.12之前的系统  
`curl -L -O https://pqrs.org/latest/karabiner-latest.dmg`  
下载后一路下一步就好了  

macOS 10.12之后的系统  
下载源码编译出dmg 自行安装  
```
> git clone --depth 1 https://github.com/tekezo/Karabiner-Elements.git
> cd Karabiner-Elements
> make
```

#### 遇到的问题
1. `error: tool 'xcodebuild' requires Xcode`  
需要安装xcode  
2. `fatal error: 'boost/optional.hpp' file not found`  
需要安装boost `brew install boost`  
3. 出现如下图的报错
![](http://77wdec.com1.z0.glb.clouddn.com/WX20180508-185907@2x.png)  
不用关心 包已经打好了  
[这里](https://pan.baidu.com/s/1iNM-qq0XG2pGrGJ_uHhznA)是我打好的一个包 可以直接拿来使用  

### 使用
![](http://77wdec.com1.z0.glb.clouddn.com/WX20180509-154509.png)
如图所示 我修改了外接键盘上的f1-f12为笔记本上键盘的功能  
我们可以将键盘上任意一个键修改为我们想要的键  
更多使用 点击[这里](https://pqrs.org/osx/karabiner/document.html)

### 参考资料
[关于boost](https://www.boost.org)  
[Karabiner](https://github.com/tekezo/Karabiner)  
[Karabiner-Elements](https://github.com/tekezo/Karabiner-Elements)
[Karabiner使用文档](https://pqrs.org/osx/karabiner/document.html)