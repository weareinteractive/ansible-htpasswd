#!/bin/bash

# define variables
ROLE_DIR=/role
ROLE_NAME=franklinkim.htpasswd

# install dependencies
# echo '* installing dependencies'
# ansible-galaxy install franklinkim.openssl

# create role symnlink
ln -s $ROLE_DIR /etc/ansible/roles/$ROLE_NAME

echo 'running playbook'
ansible-playbook --version
ansible-playbook --syntax-check -i 'localhost,' -c local $ROLE_DIR/tests/main.yml
ansible-playbook -vvvv -i 'localhost,' -c local $ROLE_DIR/tests/main.yml
