# Docker role
This role is intended to install all docker packages and their dependencies even to be ready for kubernetes in all vagrant VMs as:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg-agent
  - software-properties-common
  - docker-ce
  - docker-ce-cli
  - containerd.io
  - docker-compose

# Role variables
  - docker_url_gpg: https://download.docker.com/linux/ubuntu/gpg
  - docker_url_repo: https://download.docker.com/linux/debian

# Playbook example
```
- hosts: all
  become: true
  roles:
  - docker
```
# Author

> Rodolfo Sauce-Guinand - rrodolfos gmail com