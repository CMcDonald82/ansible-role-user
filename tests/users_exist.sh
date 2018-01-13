#!/bin/bash

# Exit on any command failure
set -e 

deploy_test_1_user_exists=$(id -u deploy_test_1 > /dev/null 2>&1; echo $?);
if [ $deploy_test_1_user_exists -eq 0 ]; then 
  echo "User deploy_test_1 exists"
else
  echo "User deploy_test_1 does not exist"
fi

deploy_test_2_user_exists=$(id -u deploy_test_2 > /dev/null 2>&1; echo $?);
if [ $deploy_test_2_user_exists -eq 0 ]; then 
  echo "User deploy_test_2 exists"
else
  echo "User deploy_test_2 does not exist"
fi
