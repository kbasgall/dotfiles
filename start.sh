#!/bin/bash

echo "starting containers"
docker-compose up -d &>/dev/null
echo "sleepy"
sleep 180
echo "creating facilities"
dc run web python manage.py dev_create_facilities_fixture_data &>/dev/null
if [ $? -eq 0 ]; then
    echo -e "\033[1;32mDone!!\a\033[0m"
else
    echo -e "\033[1;31mFailed\a\033[0m"
fi