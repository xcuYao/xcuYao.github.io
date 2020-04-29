1. 动态库 .dylib .framwork ==> 动态库是为了实现代码共享、资源共用
2. apple为何不推荐动态库  ==> 影响启动速度
3. 静态库 .a
4. 静态库 动态库 区别
静态库：链接时完整地拷贝至可执行文件中，被多次使用就有多份冗余拷贝
动态库：链接时不复制，程序运行时由系统动态加载到内存，供程序调用，系统只加载一次，多个程序共用，节省内存(但三方生成的framwork只能在自己的app内使用，属于被阉割的动态库)
5. .a .framwork 区别
.a是纯二进制文件  .framework中除了有二进制文件之外还有资源文件
.a文件不能直接使用，至少还有.h文件配合，.framework文件可以直接使用，因为本身包含了h文件和其他文件
6. 系统的.framwork为动态库  自己生成的 .framework 为静态库, 系统不允许我们生成动态库
7. 在 iOS 8 之前，iOS 只支持以静态库的方式来使用第三方的代码
8. 静态库不能包含像 xib 文件，图片这样的资源文件

```
spec.pod_target_xcconfig = { "DEFINES_MODULE" => "YES" }
```
如果设置为YES,会认为项目自定义自己的组件,允许项目通过组件的方式引入

```
spec.compiler_flags = [
    '-fno-omit-frame-pointer',
    '-fexceptions',
    '-Wall',
    '-Werror',
    '-std=c++1y',
    '-fPIC'
]
```
传递给编译器一堆规则


```
spec.header_dir = 'Three20Core'
```
The directory where to store the headers files so they don't break includes.