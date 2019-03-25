#!/bin/bash

host='35.187.118.194'
username='appuser'

ssh $username@$host "sudo apt update"
ssh $username@$host "sudo apt install -y ruby-full ruby-bundler build-essential"

