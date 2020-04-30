#! /bin/bash

gitbook build

cd ..

# 删除除src之外的文件
ls | grep -v src | xargs rm -rf {}

cd src

# 将_books文件夹下内容移动到上级目录
cp -r _book/* ../

git add . && git commit -m $1

git pull

git push