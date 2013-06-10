iVillage Vagrant Dev Box
========================

Welcome!  This Vagrant dev box was created with the intention of mirroring the iVillage production server environment as closely as possible, and to create a standardized development environment for all techies.  Since this is hosted on GitHub, environment enhancements and fixes can be distributed simply by performing a 'git pull' and then 'vagrant provision'.

Minimum System Requirements:
----------------------------
   - VirtualBox 4.2.12 <https://www.virtualbox.org/wiki/Downloads>
   - Vagrant 1.2.2 <http://downloads.vagrantup.com/>
   - 4GB RAM
   - 64 bit operating system (Mac OS X or Linux highly recommended)

How to use this:
----------------
  1. Download and install VirtualBox and Vagrant if necessary.
  2. Edit your local hosts file and add these lines (if these private IP addresses conflict on your network, you will need to change these settings in the VagrantFile):
     192.168.50.101 local.edit.ivillage.com local.api.ivillage.com local.cms.ivillage.com
     192.168.50.102 local.ivillage.com local.www.ivillage.com
     192.168.50.104 local.mps.ivillage.com
     192.168.50.105 local.mps.ivillage.com
  3. In the same directory as this README file, run in a terminal 'vagrant up'
  4. ???
  5. Profit!

Create desired environment directories
--------------------------------------
The box provisioning script will spin up a server each for iv6, vishnu, mps, and/or arwen if a matching directory is found within this directory.  Boxes will spin up only if a directory is found for the respective application.

Note: MySQL (Percona) is installed with a blank root password on all boxes.

Connecting via SSH
------------------
Use the "vagrant ssh <box_id>" command in your shell.  For example, "vagrant ssh iv6" to access the iv6 drupal box.

Note for Windows users: since Windows doesn't have ssh built in, this will not work and you will need to do a little hacking.  see <http://stackoverflow.com/questions/9885108/ssh-to-vagrant-box-in-windows> for a helpful discussion on this.

Installing new versions of this package
---------------------------------------
From time to time, new configuration versions will be released.  To apply these, simply do a "git pull" followed by "vagrant reload".  It's that simple!

Other Vagrant commands
----------------------
  - vagrant help
  - vagrant up
  - vagrant halt
  - vagrant reload

Interested in learning more?
----------------------------
Check out the following websites:
http://docs.vagrantup.com/v2/getting-started/index.html
http://docs.puppetlabs.com/#puppetpuppet