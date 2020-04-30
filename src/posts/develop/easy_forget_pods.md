#### 多版本cocoapods
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
sudo gem install cocoapods -v 1.8.4
// cocoapods的所有版本
https://rubygems.org/gems/cocoapods/versions
// 卸载cocoapods
sudo gem uninstall cocoapods
```

#### 制作pod
```
// 添加pod私有源
pod repo add opt-podspecs git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git

// pod lib 指定源
pod lib lint --sources='git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git,https://github.com/CocoaPods/Specst'
pod lib lint --sources='git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git,https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git,git@code.aihuishou.com:PTJ-APP/rn-specs-repo-ios.git' --allow-warnings

// 发布到指定库
pod repo push --allow-warnings opt-podspecs OPTAliPay.podspec

// pod subspec 发布到指定源(opt-podspecs)
pod repo push --sources=git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git,https://github.com/CocoaPods/Specs.git --allow-warnings opt-podspecs OPTModule.podspec
pod repo push --sources=git@code.aihuishou.com:PTJ-APP/pod-specs-repo.git,https://github.com/CocoaPods/Specs.git,git@code.aihuishou.com:PTJ-APP/rn-specs-repo-ios.git --allow-warnings opt-podspecs OPTModule.podspec

```

构建framwork的target中 是无法使用桥接文件的  
支付宝framework 封装需要增加dummy文件  