## 分支相关
分支重命名
```bash
git br -m newName
git push origin newName
git push --delete origin oldName
```
批量删除（release 开头的分支）
```
git br | grep 'release*' | xargs git br -d
```
## 配置简写
```ruby
[alias]
        co = checkout
        br = branch
        ci = commit
        st = status
        lg = "log --graph --pretty=format:' %C(auto)%h %d%s %Cblue%an %Cgreen%ar'"
        last = log -l HEAD
[push]
        default = simple
[pull]
        rebase = true
```

## 合并多个comit
```
# 往前三个版本
git rebase -i HEAD~3
# 往前到3a4226b这个版本号(不包括)
git rebase -i 3a4226b

# 弹出窗口 
pick 3ca6ec3   '注释**********'
pick 1b40566   '注释*********'
pick 53f244a   '注释**********'
将pick改为squash或s后保存即可
```

## tag操作
```
# 删除所有tag
git tag | xargs git tag -d

# 显示所有tag
git tag --list

# 删除远端tag
git push origin --delete tag <tagName>

# 删除tag
git tag --delete <tagName>

# 推送到远端
git push origin <tagName>

git push --tags 

```

## 撤销到前一个commit
```
// 保留修改
git reset --soft HEAD~1
// 撤销修改
git reset --hard HEAD~1
// amend 撤销
git reset --soft HEAD@{1}
git reset --hard HEAD@{1}

```
## 远程分支管理
```
// 同步远程分支
git remote update

// 查看需要删除的远程分支 
git remote prune origin --dry-run

// 删除上条命令列出的分支
git remote prune origin

// 删除本地分支
git br -d 分支名

// 删除远程分支
git push origin --delete 分支名

```

## 设置
```
// 指定tag克隆
git clone --branch <tag_name> <repo_url>
// 修改远程路径
git remote set-url origin new.git.url/here
```

## 修改地址
```
// 列出地址
git remote -v
// 修改地址
git remote set-url origin https://github.com/user/repo2.git
```

## submodule
```
// git 删除submodule
https://coderwall.com/p/csriig/remove-a-git-submodule
1. 删除.gitmodules 下配置
2. git rm --cached submodule path

// 初始化
git submodule init
git submodule update

```

## .gitignore 不管用
```
git rm -rf --cached .
git add .
```

## 恢复被删除的某个文件
```
git reset -- <file>
git checkout -- <file>
```
