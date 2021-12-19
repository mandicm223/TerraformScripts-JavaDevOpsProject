#! /bin/bash

# Install Java\
sudo amazon-linux-extras install java-openjdk11 -y

# Download and install Jenkins
yum update -y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
amazon-linux-extras install epel -y
yum install jenkins -y

# Start Jenkins
systemctl start jenkins

# Enable Jenkins
systemctl enable jenkins

# Install Git
yum install git -y

# Make sure Jenkins comes up after reboot
chkconfig jenkins on