# redis_cluster role
This role does the following task to build a redis cluster:
  - Copy docker-compose.yml
  - Copy redis-7000 node redis.conf
  - Copy redis-7001 node redis.conf
  - Copy redis-7002 node redis.conf
  - Copy redis-7003 node redis.conf
  - Copy redis-7004 node redis.conf
  - Copy redis-7005 node redis.conf
  - docker-compose up -d
  - Create cluster

# Requirements
  - Docker collection for Ansible

# Role variables
  - redis_cluster_cfg_path: /opt/redis_cluster/
  - redis_cluster_host_ip: "{{ ansible_facts['eth1']['ipv4']['address'] }}"

# Playbook example
```
- hosts: redis.cluster
  become: true
  roles:
  - redis_cluster
```
# Author

> Rodolfo Sauce-Guinand - rrodolfos gmail com
