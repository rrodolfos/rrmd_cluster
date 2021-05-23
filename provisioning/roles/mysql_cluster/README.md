# mysql_cluster role
This role does the following task to build a mysql source / replica cluster:
  - Copy docker-compose.yml and run docker-compose up -d
  - Configure mysql source node
  - Configure mysql replica node
  - Start replica

# Requirements
  - MySQL collection for Ansible
  - Docker collection for Ansible

# Role variables
  - mysql_cluster_mysql_root_password: root
  - mysql_cluster_mysql_replica_password: mysqlre
  - mysql_cluster_cfg_path: /opt/mysql_cluster/
  - mysql_cluster_host_ip: "{{ ansible_facts['eth1']['ipv4']['address'] }}"

# Playbook example
```
- hosts: mysql.cluster
  become: true
  roles:
  - mysql_cluster
```
# Author

> Rodolfo Sauce-Guinand - rrodolfos gmail com
