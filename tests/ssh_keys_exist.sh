#!/bin/bash

# Exit on any command failure
set -e 

ssh -q -o StrictHostKeyChecking=no -o PubkeyAuthentication=yes -o PasswordAuthentication=no deploy@$container_id "ls >/dev/null </dev/null"
if [ $? -eq 0 ]; then
  echo "key copied to remote server"
else
  echo "key not copied to remote server"
fi