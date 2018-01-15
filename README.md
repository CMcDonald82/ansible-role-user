# ansible-role-users

[![Build Status](https://travis-ci.org/CMcDonald82/ansible-role-users.svg?branch=master)](https://travis-ci.org/CMcDonald82/ansible-role-users)

Ansible role for creating users on an Ubuntu server

## Requirements

None

## Role Variables

The following variables with their default values are listed below.

  ```
  users: []
  ```

  This is the list of users to be created. An example of the format of an entry in users:

  ```
  users:
    - username: deploy
      password: "{{ vault_deploy_password }}"
      groups:
        - sudo
      append: yes
      ssh_keys:
        - /path/to/key1
      update_password: always
      shell: /bin/bash
      create_home: true
      home: /home/deploy 
  ```

  These are the available parameters for each user:
  * username (required): Name of the user to create or modify.
  * password: Always generate a crypted password for this value. It is a good idea to store this password in an encrypted file. See [this playbook](https://github.com/CMcDonald82/ansible-playbook-ubuntu-phoenix) for an example of how to do this.
  * groups: Any groups you want the user to be added to. For example, you can add the user to the sudo group to give them sudo privileges.
  * append (default = no): yes will only add groups, not set them to just the list in groups. 
  * ssh_keys: The list of ssh public keys to add for the user. Each public key should be specified here by the path to that key on the local machine (ex. ~/.ssh/id_rsa.pub)
  * update_password (can either be 'always' or 'on_create'): always will update passwords if they differ. on_create will only set the password for newly created users.
  * shell (default is /bin/bash): Optionally set the user's shell.
  * create_home (default = yes): Unless set to no, a home directory will be made for the user when the account is created or if the home directory does not exist.
  * home: Optionally set the user's home directory.


  ```
  users_removed: []
  ```

  This is a list of the users to be removed from the system. An example of the format of an entry in users_removed:

  ```
  users_removed:
    - username: deploy
      remove: yes
  ```

  These are the available parameters for each user:
  * username (required): Name of the user to remove.
  * remove (default = no): When used with state=absent, behavior is as with userdel --remove. 


  ```
  users_default_shell: /bin/bash
  ```

  Sets the default shell for users. Defaults to /bin/bash


  ```
  enable_passwordless_sudo: true
  ```
  
  This will enable passwordless sudo for the 'sudo' group.
  For example, set this to true if you're planning to use Ansible's 'synchronize' module in a playbook.
  Otherwise the playbook will fail when trying to use the 'synchronize' module (rsync) when remote_user is not set to root. 
  See [this issue](https://github.com/ansible/ansible/issues/15297) for details.


## Example Playbook
NOTE: This assumes the required vault_deploy_password variable has been set in a file within group_vars/all wherever this playbook is being run

```
- name: Setup Ubuntu server with PostgreSQL, Nginx, SSL, UFW for use with Phoenix app
  hosts: all
  remote_user: "{{ remote_username }}"
  become: yes

  roles:
    - role: user_role
      users:
        - username: deploy
          password: "{{ vault_deploy_password }}"
          groups:
            - sudo
          append: yes
          ssh_keys:
            - /path/to/key1 
          update_password: always
          shell: /bin/bash
          create_home: true
          home: /home/deploy 
      users_removed:
        - username: old_deploy_user
          remove: yes
      enable_passwordless_sudo: true
```

## Dependencies

None