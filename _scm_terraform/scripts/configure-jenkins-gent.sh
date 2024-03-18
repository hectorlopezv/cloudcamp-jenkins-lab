#!/bin/bash
yum update –y
dnf install docker -y
systemctl enable docker
groupadd jenkins
useradd -c " Jenkins Agent to work as a node slave" -g jenkins -G jenkins jenkins_agent
usermod -a -G docker jenkins_agent