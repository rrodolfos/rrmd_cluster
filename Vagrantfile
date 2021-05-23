Vagrant.configure("2") do |config|

  ########## Cluster mysql machine ##########
  config.vm.define "mysql.cluster", autostart: false do |config|
    config.vm.box = "debian/buster64"
    config.vm.hostname = "mysql.cluster"
    config.vm.network "private_network", ip: "192.168.33.13"

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/mysql_cluster_playbook.yml"
      ansible.compatibility_mode = "2.0"
    end

    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1536"
      vb.cpus = "2"
    end
  end

  ########## Cluster redis machine ##########
  config.vm.define "redis.cluster", autostart: false do |config|
    config.vm.box = "debian/buster64"
    config.vm.hostname = "redis.cluster"
    config.vm.network "private_network", ip: "192.168.33.14"

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/redis_cluster_playbook.yml"
      ansible.compatibility_mode = "2.0"
    end

    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "2"
    end
  end

  ########## Cluster rabbitmq machine ##########
  config.vm.define "rabbitmq.cluster", autostart: false do |config|
    config.vm.box = "debian/buster64"
    config.vm.hostname = "rabbitmq.cluster"
    config.vm.network "private_network", ip: "192.168.33.15"

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/rabbitmq_cluster_playbook.yml"
      ansible.compatibility_mode = "2.0"
    end

    config.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "2"
    end
  end

end
