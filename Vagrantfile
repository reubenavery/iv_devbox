# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # fix hang after `Waiting for VM to boot. This can take a few minutes.`
  # https://github.com/mitchellh/vagrant/issues/455#issuecomment-1740526
  config.ssh.max_tries = 250

  # If the iv6 directory is present, spin up a VM for this listening on 192.168.50.101.
  if File.exists?( File.dirname(__FILE__) + '/iv6' ) then
    config.vm.define :iv6 do |iv6|
      iv6.vm.hostname = 'ivillage-iv6-devbox'
      iv6.vm.network :private_network, ip: "192.168.50.101"
      iv6.vm.box = "iv_centos_5.9_x86_64.v1"
      iv6.vm.box_url = "https://www.dropbox.com/s/246g93kbbfs3tez/iv_centos_5.9_x86_64.v1.box"
      #iv6.vm.network :forwarded_port, guest: 80, host: 8001
      
      iv6.vm.synced_folder 'iv6', "/opt/ivillage/drupal6", :owner => 'www'
      iv6.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 1024]
      end
      
      iv6.vm.provision :puppet do |puppet|
        puppet.options = '--environment=drupal6'
        puppet.manifest_file = 'ivillage-drupal6.pp'
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path = 'puppet/modules'
      end
    end
    
  end

  # If the vishnu directory is present, spin up a VM for this listening on 192.168.50.102.
  if File.exists?( File.dirname(__FILE__) + '/vishnu' ) then
    config.vm.define :vishnu do |vishnu|
      vishnu.vm.hostname = 'ivillage-vishnu-devbox'
      vishnu.vm.network :private_network, ip: "192.168.50.102"
      vishnu.vm.box = "iv_centos_6.0_x86_64.v1"
      vishnu.vm.box_url = "https://www.dropbox.com/s/jbmk8ykskhwu1yj/iv_centos_6.0_x86_64.v1.box"
      vishnu.vm.synced_folder 'vishnu', "/opt/ivillage/vishnu", :owner => 'www'
      
      vishnu.vm.synced_folder 'iv6', "/opt/ivillage/drupal6", :owner => 'www'
      vishnu.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 1024]
      end

      vishnu.vm.provision :puppet do |puppet|
        puppet.options = '--environment=vishnu'
        puppet.manifest_file = 'ivillage-vishnu.pp'
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path = 'puppet/modules'
      end
    end
  end

  # Spin up a VM for MySQL listening on 192.168.50.103.
#   config.vm.define :mysql do |mysql|
#     mysql.vm.hostname = 'ivillage-mysql-devbox'
#     mysql.vm.network :private_network, ip: "192.168.50.103"
#     mysql.vm.box = "iv_centos_6.0_x86_64.v1"
#     mysql.vm.box_url = "https://www.dropbox.com/s/jbmk8ykskhwu1yj/iv_centos_6.0_x86_64.v1.box"
#
#     #mysql.vm.network :forwarded_port, guest: 3306, host: 33006
#
#     mysql.vm.provision :puppet do |puppet|
#       puppet.options = '--environment=mysql'
#       puppet.manifest_file = 'ivillage-mysql.pp'
#       puppet.manifests_path = 'puppet/manifests'
#       puppet.module_path = 'puppet/modules'
#     end
#   end

  # If the mps directory is present, spin up a VM for this listening on 192.168.50.104.
  if File.exists?( File.dirname(__FILE__) + '/mps' ) then
    config.vm.define :mps do |mps|
      mps.vm.hostname = 'ivillage-mps-devbox'
      mps.vm.network :private_network, ip: "192.168.50.104"
      mps.vm.box = "iv_centos_6.0_x86_64.v1"
      mps.vm.box_url = "https://www.dropbox.com/s/jbmk8ykskhwu1yj/iv_centos_6.0_x86_64.v1.box"
      mps.vm.synced_folder 'mps', "/opt/ivillage/mps", :owner => 'www'

      mps.vm.provision :puppet do |puppet|
        puppet.options = '--environment=mps'
        puppet.manifest_file = 'ivillage-mps.pp'
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path = 'puppet/modules'
      end
    end
  end

  # If the arwen directory is present, spin up a VM for this listening on 192.168.50.105.
  if File.exists?( File.dirname(__FILE__) + '/arwen' ) then
    config.vm.define :arwen do |arwen|
      arwen.vm.hostname = 'ivillage-arwen-devbox'
      arwen.vm.network :private_network, ip: "192.168.50.105"
      arwen.vm.box = "iv_centos_6.0_x86_64.v1"
      arwen.vm.box_url = "https://www.dropbox.com/s/jbmk8ykskhwu1yj/iv_centos_6.0_x86_64.v1.box"
      arwen.vm.synced_folder 'arwen', "/opt/ivillage/arwen", :owner => 'www'

      arwen.vm.provision :puppet do |puppet|
        puppet.options = '--environment=arwen'
        puppet.manifest_file = 'ivillage-arwen.pp'
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path = 'puppet/modules'
      end
    end
  end

end
