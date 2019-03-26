#!/bin/bash

git clone -b monolith https://github.com/express42/reddit.git /home/appuser/reddit

cd /home/appuser/reddit && bundle install

cd /home/appuser/reddit && puma -d

