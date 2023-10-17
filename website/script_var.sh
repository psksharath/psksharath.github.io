#!/bin/bash
GIT=git@github.com:psksharath/jenkinspipeline.github.io
REPO=jenkinspipeline.github.io
WEBSITE=https://www.tooplate.com/zip-templates/2135_mini_finance.zip
PKG=apt
FILE=2135_mini_finance
sudo $PKG update
sudo $PKG install wget git unzip figlet -y
figlet gitclone
git clone $GIT

if [ $? -eq 0 ]
then 
mkdir -p webfiles
cd webfiles
sudo wget $WEBSITE
sudo unzip -o $FILE.zip
sudo rm -rf ~/$REPO/*
sudo cp -r $FILE/* ~/$REPO/
cd ..
sudo rm -rf webfiles
cd ~/$REPO
git add .
git status
sleep 4
git commit -m "$(date)"
git push -f
figlet done

else
	echo "gitclone failed"
fi
