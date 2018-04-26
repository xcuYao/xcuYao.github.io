---
layout: 		post
title:			"Xcode 打包自增build脚本"
date:			2016-08-09
categories:		工具
key: 			10009
---
### 效果 
打包上传的时候 Build 号可以自动增加  

### 具体操作
选择 targets ->项目名->Build Phases    
点击＋号 New Run Script Phase   
在新增加的选项中加入 如下脚本  

``` ruby
if [ $CONFIGURATION == Release ]; then
echo "Bumping build number..."
plist=${PROJECT_DIR}/${INFOPLIST_FILE}
#increment the build number (ie 115 to 116)
buildnum=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${plist}")
if [[ "${buildnum}" == "" ]]; then
echo "No build number in $plist"
exit 2
fi
buildnum=$(expr $buildnum + 1)
/usr/libexec/Plistbuddy -c "Set CFBundleVersion $buildnum" "${plist}"
echo "Bumped build number to $buildnum"

else
echo $CONFIGURATION " build - Not bumping build number."
fi
```

保存即可  

### 参考图
![](http://7xn5wd.com1.z0.glb.clouddn.com/屏幕快照%202015-09-30%20下午5.36.49.png)