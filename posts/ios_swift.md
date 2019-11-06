1. protocol optional
``` swift
protocol MyProtocol {
    func doSomethingNonOptionalMethod()
    func doSomethingOptionalMethod()
}

extension MyProtocol {
    func doSomethingOptionalMethod(){ 
        // leaving this empty 
    }
}
```

2. 多版本cocoapods
cocoapods 是通过RubyGems来分发的，安装多版本的cocoapods可以通过安装不同版本的的ruby
来实现
rvm用来管理不同版本ruby
```
// 安装rvm
curl -L get.rvm.io | bash -s stable
// 查看可用的ruby版本信息
rvm list known
// 安装ruby2.5
rvm install 2.5
// 查看已经安装的ruby版本
rvm list
// 切换ruby版本
rvm use 2.5/default/2.4/2.6 ....
// 卸载已经安装的ruby版本
rvm remove 2.5
// 安装cocoapods指定版本
sudo gem install cocoapods -v 1.5.3
// cocoapods的所有版本
https://rubygems.org/gems/cocoapods/versions
// 卸载cocoapods
sudo gem uninstall cocoapods

```

3. 
```
构建framwork的target中 是无法使用桥接文件的
# 添加pod私有库
pod repo add opt-podspecs git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git
# 发布到指定库
pod repo push --allow-warnings opt-podspecs OPTAliPay.podspec
# pod lib 指定源
pod lib lint --sources='git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git,https://github.com/CocoaPods/Specst'
pod lib lint --sources='git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git,https://github.com/CocoaPods/Specs,git@code.aihuishou.com:PTJ-APP/rn-specs-repo-ios.git' --allow-warnings
# pod subspec 发布
pod repo push --sources=git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git,https://github.com/CocoaPods/Specs.git --allow-warnings opt-podspecs OPTModule.podspec
pod repo push --sources=git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git,https://github.com/CocoaPods/Specs.git,git@code.aihuishou.com:PTJ-APP/rn-specs-repo-ios.git --allow-warnings opt-podspecs OPTModule.podspec


# 删除tag
git tag -d tagName
git push --delete orgin tagName
支付宝framework 封装需要增加dummy文件 
```

4.
查看某个静态库支持的编译器架构
```
lipo -info xxx.framework/xxxxFramework
lipo -info xxx.a
```
[ARM与X86 CPU架构区别](https://zhuanlan.zhihu.com/p/38358532)  
[苹果手机产品架构图](https://static1.squarespace.com/static/51adfbd9e4b095d664d9b869/t/5abb93381ae6cf7814528be5/1522242362088/Matrix+16by9-8k.pdf)  
[armv7,armv7s,arm64,i386,x86_64的区别](https://www.jianshu.com/p/b87e6f0bac54)


5. todo
```
/// Debug 增加拷贝curl方法

/// 增加String按照位数替换Extension
/// 按需隐藏的手机号(隐藏4-7位)
var safeResidentMobile: String? {
    guard let s = residentMobile else { return nil }
    var a = Array(s)
    if a.count == 11 {
        Array(3...6).forEach { a[$0] = Character.init("*") }
    }
    return String(a)
}


```

6. 信号量
/// 信号量机制主要为了做同步操作
/// 多用于异步并行任务的 同步执行 以开启多条线程
/// 当然也可以使用 异步串行来实现 异步任务的同步执行 但此种情况只会开启一条线程
```
/// 创建一个信号量 初始值为0
dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

[AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
    if (granted) {
        [self setupAuthorizedWithDelegate:delegate];
    } else {
        [self setupDenied];
    }
    /// 任务完成 信号量+1操作
    dispatch_semaphore_signal(semaphore);
}];

/// 阻塞 直到信号量大于0 信号量-1操作
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

```
7. 一种适配的写法
```
#if swift(>=4)
#else
extension UIApplication {
    typealias LaunchOptionsKey = UIApplicationLaunchOptionsKey
}
#endif
```
8. 查看文件源码行数
```
 find Source -name "*.swift" | xargs cat |wc -l
```
9. 
```
对于ProjectA下的ClassA
self.classForCoder等同于ClassA.self
输出均为 ProjectA.classA

```

10. #selector 和 Selector
```
1. #selector 接受的是函数指针 Selector接受的是字符串
2. NSSelectorFromString()
3. NSStringFromSelector()
```

11. zsh启动速度
```
// 统计时间
time zsh -i -c exit
// 清除缓存 增加速度
sudo rm -rf /private/var/log/asl/*.asl
```
