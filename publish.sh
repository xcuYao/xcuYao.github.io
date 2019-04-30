#! /bin/bash

gitbook install & gitbook build

git pull

cp -R _books/* .

git add .

git commit -m "$0"

#git push
