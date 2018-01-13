docker exec --tty ${container_id} env TERM=xterm user_exists=$(id -u deploy_test_1 > /dev/null 2>&1);
echo $user_exists