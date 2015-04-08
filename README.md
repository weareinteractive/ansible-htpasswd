# Ansible Htpasswd Role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-htpasswd.svg)](https://travis-ci.org/weareinteractive/ansible-htpasswd)
[![Galaxy](http://img.shields.io/badge/galaxy-franklinkim.htpasswd-blue.svg)](https://galaxy.ansible.com/list#/roles/1372)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-htpasswd.svg)](https://github.com/weareinteractive/ansible-htpasswd)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-htpasswd.svg)](https://github.com/weareinteractive/ansible-htpasswd)

> `htpasswd` is an [ansible](http://www.ansible.com) role which:
>
> * installs `htpasswd`
> * manages `htpasswd` files

## Installation

Using `ansible-galaxy`:

```
$ ansible-galaxy install franklinkim.htpasswd
```

Using `requirements.yml`:

```
- src: franklinkim.htpasswd
```

Using `git`:

```
$ git clone https://github.com/weareinteractive/ansible-htpasswd.git franklinkim.htpasswd
```

## Dependencies

* Ansible >= 1.9

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```
# htpasswd:
#   - name: myapp
#     users:
#       - { name: user1, password: secret1 }
#       - { name: user1, password: secret2, crypt: [apr_md5_crypt | des_crypt | ldap_sha1 | plaintext] }

# list of entries
htpasswd: []
# path to auth files
htpasswd_path: /etc/htpasswd
```

## Example playbook

```
- host: all
  sudo: yes
  roles:
    - franklinkim.htpasswd
  vars:
    htpasswd:
      - name: myapp
        users:
        - { name: user, password: secret }
```

## Testing

```
$ git clone https://github.com/weareinteractive/ansible-htpasswd.git
$ cd ansible-htpasswd
$ vagrant up
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License
Copyright (c) We Are Interactive under the MIT license.
