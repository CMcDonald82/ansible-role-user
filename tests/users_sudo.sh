#!/bin/bash

# Exit on any command failure
set -e 

user_list=(deploy_test_1 deploy_test_3)
for usr in ${user_list[*]}
do
  sudo_enabled=$(sudo -n -v 2>&1)
  test -z "$sudo_enabled" || echo $sudo_enabled | grep -q password
  # sudo -n -l -U "$usr" 2>&1
done