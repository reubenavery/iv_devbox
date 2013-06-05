# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos_5.9_x86_64"
  config.vm.box_url = "http://tag1consulting.com/files/centos-5.9-x86-64-minimal.box"

  # fix hang after `Waiting for VM to boot. This can take a few minutes.`
  # https://github.com/mitchellh/vagrant/issues/455#issuecomment-1740526
  config.ssh.max_tries = 250

  config.vm.network :forwarded_port, guest: 80, host: 8001
  config.vm.network :forwarded_port, guest: 3306, host: 33006

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  
  if File.exists?('ivillage_d6') then
    config.vm.synced_folder 'ivillage_d6', "/opt/ivillage/drupal6"
  end
  
  # Add mps folder if it exists
  if File.exists?('mps') then
    config.vm.synced_folder 'mps', "/opt/ivillage/mps"
  end

  # Add arwen folder if it exists
  if File.exists?('arwen') then
    config.vm.synced_folder 'arwen', "/opt/ivillage/arwen"
  end
  
  # Add vishnu folder if it exists
  if File.exists?('vishnu') then
    config.vm.synced_folder 'vishnu', "/opt/ivillage/vishnu"
  end
  
  config.vm.provision :puppet do |puppet|
    puppet.options = '--environment=local'
    puppet.manifest_file = 'ivillage-dev-box.pp'
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
  end

  # Also automatically configure the VM with some small shell scripts that
  # don't belong in Puppet.
  # config.vm.provision :shell do |shell|
    #shell.path = "scripts/provision-database.sh"
  # end
end
