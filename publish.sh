#! /bin/bash

gitbook install & gitbook build

cp -R _books/* .

git add .

git commit -m "$0"

git pull

#git push
