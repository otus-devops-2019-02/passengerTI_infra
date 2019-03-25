#!/bin/bash

host='35.187.118.194'
username='appuser'

ssh $username@$host "git clone -b monolith https://github.com/express42/reddit.git /home/appuser/reddit"

ssh $username@$host "cd /home/appuser/reddit && bundle install"

ssh $username@$host "cd /home/appuser/reddit && puma -d"

