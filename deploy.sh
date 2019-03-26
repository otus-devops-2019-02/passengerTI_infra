#!/bin/bash

host='35.187.118.194'
username='appuser'
ssh_options='-i ~/.ssh/appuser'

ssh $ssh_options $username@$host "git clone -b monolith https://github.com/express42/reddit.git /home/appuser/reddit"

ssh $ssh_options $username@$host "cd /home/appuser/reddit && bundle install"

ssh $ssh_options $username@$host "cd /home/appuser/reddit && puma -d"

