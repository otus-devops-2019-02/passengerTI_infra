#!/bin/bash

host='35.187.118.194'
username='appuser'

ssh $username@$host "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927"
ssh appuser@$host "sudo bash -c 'echo \"deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse\" > /etc/apt/sources.list.d/mongodb-org-3.2.list'"

ssh $username@$host "sudo apt update"

ssh $username@$host "sudo apt install -y mongodb-org"

ssh $username@$host "sudo systemctl start mongod"

ssh $username@$host "sudo systemctl enable mongod"


