#!/bin/bash

host='35.187.118.194'
username='appuser'
ssh_options='-i ~/.ssh/appuser'

ssh $ssh_options $username@$host "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927"
ssh appuser@$host "sudo bash -c 'echo \"deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse\" > /etc/apt/sources.list.d/mongodb-org-3.2.list'"

ssh $ssh_options $username@$host "sudo apt update"

ssh $ssh_options $username@$host "sudo apt install -y mongodb-org"

ssh $ssh_options $username@$host "sudo systemctl start mongod"

ssh $ssh_options $username@$host "sudo systemctl enable mongod"


