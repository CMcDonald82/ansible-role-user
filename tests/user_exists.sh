#!/bin/bash

# Exit on any command failure
set -e 

docker exec --tty ${container_id} env TERM=xterm user_exists=$(id -u deploy_test_1 > /dev/null 2>&1; echo $?);
echo "TESTING!!!"
echo "$user_exists"
if [ $user_exists -eq 0 ]; then 
  echo "User exists"
else
  echo "User does not exist"
fi

# echo $user_exists