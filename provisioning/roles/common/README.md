# Common role
This role is intended to install common packages and utilities in all vagrant VMs as:
  - vim
  - htop
  - mc
  - screen
  - python-apt
  - aptitude

# Playbook example
```
- hosts: all
  become: true
  roles:
  - common
```
# Author

> Rodolfo Sauce-Guinand - rrodolfos gmail com