#!/bin/bash

# Exit on any command failure
set -e 

user_list=(deploy_test_1 deploy_test_2 deploy_test_3)
for usr in ${user_list[*]}
do
  user_exists=$(id -u "$usr" > /dev/null 2>&1; echo $?)
  if [ $user_exists -eq 0 ]; then 
    echo "User $usr exists"
  else
    echo "User $usr does not exist"
  fi
done

