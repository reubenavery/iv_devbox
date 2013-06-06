iVillage Dev Box

Welcome!  This Vagrant dev box was created with the intention of mirroring the iVillage production server environment as closely as possible, and to create a standardized development environment for all techies.  Since this is hosted on GitHub, environment enhancements and fixes can be distributed simply by performing a 'git pull' and then 'vagrant provision'.

How to use this:
  1. Download and install VirtualBox 4.2 from https://www.virtualbox.org/wiki/Downloads
  2. Download and install Vagrant 1.2 from http://downloads.vagrantup.com/tags/v1.2.2
  3. Edit your local hosts file and add this line:
     127.0.0.1 local.ivillage.com local.edit.ivillage.com local.api.ivillage.com local.cms.ivillage.com local.mps.ivillage.com local.arwen.ivillage.com
  4. In the same directory as this README file, run in a terminal 'vagrant up'
  5. ???
  6. Profit!

This box will detect if the following directories exist here and if they do, will create virtual host entries in Apache:
  - ivillage_d6 (drupal)
  - vishnu
  - arwen
  - mps

Use the command "vagrant ssh" to terminal in to your dev box and "vagrant help" to see other commands.

Note: MySQL (Percona) is installed with a blank root password.


