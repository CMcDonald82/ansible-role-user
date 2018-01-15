#!/bin/bash

# Exit on any command failure
set -e 

user_list=(deploy_test_1 deploy_test_3)
for usr in ${user_list[*]}
do
  sudo groups $usr | grep -q "sudo" && (echo "Group: PASS" && exit 0) || (echo "Group: FAIL" && exit 0)
done