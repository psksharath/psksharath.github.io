#!/bin/bash
apt --help &>> /dev/null
if [ $? -eq 0 ]
then
   sudo apt update
   sudo apt install wget figlet net-tools unzip apache2 -y
   sudo systemctl start apache2
   sudo systemctl enable apache2
   mkdir -p webfiles
   cd webfiles
   sudo wget https://www.tooplate.com/zip-templates/2118_chilling_cafe.zip
   sudo unzip -o 2118_chilling_cafe.zip
   sudo rm -rf /var/www/html/*
   sudo cp -r 2118_chilling_cafe/* /var/www/html/
   cd ..
   sudo rm -rf webfiles
   sudo systemctl restart apache2
   sudo systemctl status apache2 | grep Active
   figlet done
else
    sudo yum install wget net-tools unzip httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo mkdir -p webfiles
    cd webfiles
    sudo wget https://www.tooplate.com/zip-templates/2118_chilling_cafe.zip
    sudo unzip -o 2118_chilling_cafe.zip
    sudo rm -rf /var/www/html/*
    sudo cp -r 2118_chilling_cafe/* /var/www/html/
    cd ..
    sudo rm -rf webfiles
    sudo systemctl restart httpd
    sudo systemctl status httpd | grep Active
fi

