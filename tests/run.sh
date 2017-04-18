#!/bin/bash

# define variables
ROLE_NAME=franklinkim.htpasswd

# create role symnlink
ln -s $(pwd) /usr/share/ansible/roles/$ROLE_NAME

# update ansible to 2.0.0.0
pip install ansible==2.0.0.0

echo 'running playbook'
ansible-playbook -vvvv -i 'localhost,' -c local $(pwd)/tests/main.yml
