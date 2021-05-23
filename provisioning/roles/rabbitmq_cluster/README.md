# redis_cluster role
This role does the following task to build a redis cluster:
  - Copy docker-compose.yml
  - docker-compose up -d
  - Create cluster

# Requirements
  - Docker collection for Ansible

# Role variables
  - rabbitmq_cluster_default_user: rabbitmq
  - rabbitmq_cluster_default_pass: rabbitmq
  - rabbitmq_cluster_erlang_cookie: rabbitmq
  - rabbitmq_cluster_cfg_path: /opt/rabbitmq_cluster/
  - rabbitmq_cluster_host_ip: "{{ ansible_facts['eth1']['ipv4']['address'] }}"

# Playbook example
```
- hosts: rabbitmq.cluster
  become: true
  roles:
  - rabbitmq_cluster
```
# Author

> Rodolfo Sauce-Guinand - rrodolfos gmail com