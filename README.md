# Ansible franklinkim.htpasswd role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-htpasswd.svg)](https://travis-ci.org/weareinteractive/ansible-htpasswd)
[![Galaxy](http://img.shields.io/badge/galaxy-franklinkim.htpasswd-blue.svg)](https://galaxy.ansible.com/list#/roles/1372)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-htpasswd.svg)](https://github.com/weareinteractive/ansible-htpasswd)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-htpasswd.svg)](https://github.com/weareinteractive/ansible-htpasswd)

> `franklinkim.htpasswd` is an [Ansible](http://www.ansible.com) role which:
>
> * installs `htpasswd`
> * manages `htpasswd` files

## Installation

Using `ansible-galaxy`:

```shell
$ ansible-galaxy install franklinkim.htpasswd
```

Using `requirements.yml`:

```yaml
- src: franklinkim.htpasswd
```

Using `git`:

```shell
$ git clone https://github.com/weareinteractive/ansible-htpasswd.git franklinkim.htpasswd
```

## Dependencies

* Ansible >= 2.0

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```yaml
---
#
# htpasswd:
#   - name: myapp
#     users:
#       - { name: user1, password: secret1 }
#   - name: otherapp
#     path: /foo/bar
#     users:
#       - { name: user2, password: secret2, crypt: ldap_sha1 }
#       - { name: user3, password: secret3, state: absent }

# list of entries
htpasswd: []
# path to auth files
htpasswd_path: /etc/htpasswd
# default crypt [apr_md5_crypt | des_crypt | ldap_sha1 | plaintext]
htpasswd_crypt: apr_md5_crypt
# auth files owner
htpasswd_owner: root
# auth files group
htpasswd_group: root
# auth files mode
htpasswd_mode: "0644"
# list of package to install, python-passlib is a pre-requisite for htpasswd ansible module
htpasswd_packages:
  - python-passlib
  - apache2-utils
# no log information by default to prevent showing passwords
htpasswd_no_log: yes

```


## Usage

This is an example playbook:

```yaml
---

- hosts: all
  become: yes
  roles:
    - franklinkim.htpasswd
  vars:
    htpasswd:
      - name: myapp
        users:
          - { name: user1, password: secret1 }
      - name: otherapp
        path: /usr/local/etc
        users:
          - { name: user2, password: secret2 }
          - { name: user3, password: secret3 }
        mode: "0600"
        group: staff
    htpasswd_no_log: no

- hosts: all
  become: yes
  roles:
    - franklinkim.htpasswd
  vars:
    htpasswd:
      - name: myapp
        users:
          - { name: user1, password: secret1 }
      - name: otherapp
        path: /usr/local/etc
        users:
          - { name: user2, password: secret2, state: absent }
          - { name: user3, password: secret3 }
        mode: "0600"
        group: staff
    htpasswd_no_log: no

```


## Testing

```shell
$ git clone https://github.com/weareinteractive/ansible-htpasswd.git
$ cd ansible-htpasswd
$ make test
```

## Contributing
In lieu of a formal style guide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

*Note: To update the `README.md` file please install and run `ansible-role`:*

```shell
$ gem install ansible-role
$ ansible-role docgen
```

## License
Copyright (c) We Are Interactive under the MIT license.
