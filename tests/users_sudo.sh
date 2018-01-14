#!/bin/bash

# Exit on any command failure
set -e 

user_list=(deploy_test_1 deploy_test_3)
for usr in ${user_list[*]}
do
  sudo -v -U $usr
done