#!/bin/bash
#Website setup
#Adding Variables
URL=https://www.tooplate.com/zip-templates/2118_chilling_cafe.zip
SRV=httpd
SERVICE=apache2
PKG=yum
PACKAGE=apt
FILE=2118_chilling_cafe
apt --help &>> /dev/null

if [ $? -eq 0 ]

then

    echo "Updating newest versions of packages and their dependencies"
    sudo $PACKAGE update &>> /dev/null
    echo "Install $SERVICE wget net-tools unzip and figlet package"
    sudo $PACKAGE install wget net-tools unzip figlet $SERVICE -y
    echo "Start $SERVICE service and enable"
    sudo systemctl start $SERVICE
    sudo systemctl enable $SERVICE
    echo "Create directory webfiles"
    mkdir -p webfiles
    cd webfiles
    echo "Download the zip file from the tooplate website"
    sudo wget $URL &>> /dev/null
    echo "Unzip the downloaded file from tooplate website"
    sudo unzip -o $FILE.zip &>> /dev/null
    echo "Remove existing files"
    sudo rm -rf /var/www/html/*
    echo "Copy all the files from source to destination"
    sudo cp -r $FILE/* /var/www/html/ &>> /dev/null
    cd ..
    echo "Remove existing files"
    sudo rm -rf webfiles
    echo "Restart $SERVICE service"
    sudo systemctl restart $SERVICE
    sudo systemctl status $SERVICE | grep Active
    figlet done

else

    echo "Updating newest versions of packages and their dependencies"
    sudo $PKG install update &>> /dev/null
    echo "Install $SRV wget net-tools unzip package"
    sudo $PKG install wget net-tools unzip $SRV -y
    echo "Start $SRV service and enable"
    sudo systemctl start $SRV
    sudo systemctl enable $SRV
    echo "Create directory webfiles"
    mkdir -p webfiles
    cd webfiles
    echo "Download the zip file from the tooplate website"
    sudo wget $URL &>> /dev/null
    echo "Unzip the downloaded file from tooplate website"
    sudo unzip -o $FILE.zip &>> /dev/null
    echo "Remove existing files"
    sudo rm -rf /var/www/html/*
    echo "Copy all the files from source to destination"
    sudo cp -r $FILE/* /var/www/html/ &>> /dev/null
    cd ..
    echo "Remove existing files"
    sudo rm -rf webfiles
    echo "Restart $SRV service"
    sudo systemctl restart $SRV
    sudo systemctl status $SRV | grep Active

fi

