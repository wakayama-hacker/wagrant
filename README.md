# Wagrant

The Wagrant is an Ubuntu/Xenial64 based development environment.

## What's installed

* Ubuntu 16.04 Xenial64
  * Apache
  * MySQL
  * PHP 7
  * Ruby 2.3
  * Node.js 6.x

## Getting started

Download latest version from following.

https://github.com/wakayama-hacker/wagrant/releases

Unzip a file and move into the Wagrant directory.

```
$ cd wagrant
```

Finally, run `vagrant up`.

```
$ vagrant up
```

See also: https://www.vagrantup.com/docs/getting-started/

### Requires

* VirtualBox 5.1.4 or later
* Vagrant 1.8.5 or later

## Customization

### Ansible

Place `provision-post.yml` into vagrant root directory like following.

```
- hosts: all
  tasks:
    - name: Install Ruby gems
      become: yes
      gem:
        name: "{{ item }}"
        state: latest
        user_install: no
        executable: /usr/bin/gem
      with_items:
        - mailcatcher
```

See also: http://docs.ansible.com/

### Shell script

Place `provision-post.sh` into vagrant root directory like following.

```
#!/usr/bin/env bash

set -ex

sudo apt-get install nginx
```
