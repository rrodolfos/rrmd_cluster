# Redis, RabbitMQ, MySQL and Docker (rrmd) Clusters
This repository contains vagrant and ansible configuration to deploy and provision a cluster for each one of the following services:

  - [Redis](https://redis.io/)
  - [RabbitMQ](https://www.rabbitmq.com/)
  - [MySQL](https://www.mysql.com/)

# DISCLAIMER
> This implementation is intended for test / PoC / playing purposes only, this solution is not scalable or secure enough for live / production environments. Use it at your own risk. Have fun!. ```tl;dr```

# Requirements
The below requirements are needed deploy and provision each cluster.

  - [VirtualBox](https://www.virtualbox.org/)
  - [Vagrant](https://www.vagrantup.com/)
  - [Ansible](https://www.ansible.com/)
  - [MySQL collection for Ansible](https://docs.ansible.com/ansible/latest/collections/community/mysql/index.html)
  - [Docker collection for Ansible](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html)

# what did I use for this
  - MacBook Pro 2015 CPU Core i5 8GB RAM 256GB SSD
  - OS GNU Linux/Debian 11 Bullseye 64bits (I run Linux flawlessly on my mac)
  - VirtualBox 6.1
  - Vagrant 2.2.14
    - Vagrant box debian/buster64
  - Ansible 2.10.8
  - MySQL collection for Ansible 2.1.0
  - Docker collection for Ansible 1.6.1

# Included content
  - Vagrantfile
  - ansible.cfg
  - Collections
    - mysql
    - docker
  - Playbooks
    - redis_cluster_playbook.yml
    - rabbitmq_cluster_playbook.yml
    - mysql_cluster_playbook.yml
  - Roles
    - common
    - docker
    - redis_cluster
    - rabbitmq_cluster
    - mysql_cluster

# Vagrantfile
VM machine definition as follow:
  - redis.cluster
    - 2 vcpu
    - 1024 RAM
    - 192.168.33.14 VM ip address
  - rabbitmq.cluster
    - 2 vcpu
    - 1024 RAM
    - 192.168.33.15 VM ip address
  - mysql.cluster
    - 2 vpcpu
    - 1536 RAM
    - 192.168.33.13 VM ip address 

# How to build them

### redis.cluster (Redis cluster)
This VM deploy a redis cluster on docker as follow:
  - 3 master nodes docker container
  - 3 slave nodes docker container

Those nodes use the tcp ports 7000, 7001, 7002, 7003, 7004 and 7005 on ip address 192.168.33.14

##### Create vagrant VM and deploy cluster:
To start up the VM
```
  $ vagrant up redis.cluster
```
> Coffee time!. On a MacBook Pro 2015 and 100Mbps bandwidth it took ~5 minutes. Vagrant box (base linux distro) not included.

##### Check the cluster:
To connect to the VM (ssh)
```
  $ vagrant ssh redis.cluster
```

##### Connect to the cluster:
To connect via redis-cli
```
  $ redis-cli -c -p 7000
```

##### Get cluster info:
After connect to a node
```
  192.168.33.14:7000> cluster info
```

##### Get cluster nodes list:
After connect to a node
```
  192.168.33.14:7000> cluster nodes
```

##### Set data:
After connect to a node
```
  192.168.33.14:7000> set foo bar
```

##### Get data:
After connect to a node
```
  192.168.33.14:7000> get foo
```

##### Destroy vagrant VM:
To destroy the VM
```
  $ vagrant destroy redis.cluster
```

### rabbitmq.cluster (RabbitMQ cluster)
This VM deploy a RabbitMQ cluster on docker as follow:
  - 3 cluster nodes docker container

Those nodes use the tcp ports 8080, 8081 and 8082 on ip address 192.168.33.15

##### Create vagrant VM and deploy cluster:
To start up the VM
```
  $ vagrant up rabbitmq.cluster
```
> Coffee time!. On a MacBook Pro 2015 and 100Mbps bandwidth it took ~7 minutes. Vagrant box (base linux distro) not included.

##### Check the cluster:
To connect to the VM (ssh)
```
  $ vagrant ssh rabbitmq.cluster
```

##### Connect to the cluster:
To connect via web browser
```
  http://192.168.33.15:8080
```
```
  http://192.168.33.15:8081
```
```
  http://192.168.33.15:8082
```
  `Username:` rabbitmq
  `Password:` rabbitmq

##### Destroy vagrant VM:
To destroy the VM
```
  $ vagrant destroy rabbitmq.cluster
```

### mysql.cluster (Mysql cluster)
This VM deploy a mysql cluster on docker as follow:
  - 1 source node docker container
  - 1 replica node docker container

Those nodes use the tcp ports 3306, 33060, 3307 and 33070 on ip address 192.168.33.13

##### Create vagrant VM and deploy cluster:
To start up the VM
```
  $ vagrant up mysql.cluster
```
> Coffee time!. On a MacBook Pro 2015 and 100Mbps bandwidth it took ~7 minutes. Vagrant box (base linux distro) not included.

##### Check the cluster:
To connect to the VM (ssh)
```
  $ vagrant ssh mysql.cluster
```

##### Create a database at the source node cluster:
In the mysql.cluster host
```
  $ sudo docker exec -ti mysqlso bash -c "echo 'CREATE DATABASE foobar;' | mysql -proot"
```

##### Connect to the replica node:
In the mysql.cluster host
```
  $ sudo docker exec -ti mysqlre bash -c "mysql -proot"
```

##### Check database created before on the source node:
In the mysql CLI
```
  mysql> SHOW DATABASES;
```
Look for "foobar" database created on the source node in the output

##### Get replica status:
In the mysql CLI
```
  mysql> SHOW REPLICA STATUS \G
```

##### Destroy vagrant VM:
To destroy the VM
```
  $ vagrant destroy mysql.cluster
```

# Author

> Rodolfo Sauce-Guinand - rrodolfos gmail com