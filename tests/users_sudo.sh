#!/bin/bash

# Exit on any command failure
set -e 

user_list=(deploy_test_1 deploy_test_3)
for usr in ${user_list[*]}
do
  # test sudo -l -U "$usr" 2>&1
  sudo_enabled=$(sudo -l -U "$usr" 2>&1); #test -z "$sudo_enabled" || echo $sudo_enabled | grep -q password
  echo "$sudo_enabled"
  echo "$sudo_enabled" | grep (ALL) NOPASSWD: ALL
  # sudo -n -l -U "$usr" 2>&1
done