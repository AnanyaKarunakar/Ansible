#!/bin/bash

#Colours
G="\e[32m"
R="\e[31m"
Y="\e[33m"
N="\e[0m"

echo -e "$Y Checking if Ansible is already Installed... $N"

#Check if Ansible is installed 
if command -v ansible &>/dev/null
    then
        VERSION=$(ansible --version | head -n1)
        echo -e "$GAnsible is already installed: $VERSION $N"
        exit 0
fi

echo -e "$Y Ansible not found. Installing Ansible...$N"
# Enable EPEL and install Ansible
sudo yum install -y epel-release &>/dev/null
if [ $? -ne 0 ]; then
    echo -e "$R Failed to enable EPEL repository. Exiting $N"
    exit 1
fi

sudo yum install -y ansible &>/dev/null
if [ $? -eq 0 ]; then
    VERSION=$(ansible --version | head -n1)
    echo -e "$G Ansible is installed succefully: $VERSION $N"
else
    eho -e "$R Ansible installation failed.$N"
    exit 1
fi