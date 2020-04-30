#! /bin/bash

gitbook install & gitbook build

cp -R _books/* .

git add .

git commit -m $1

git pull

git push
