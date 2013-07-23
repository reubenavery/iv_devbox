iVillage Vagrant Dev Box
========================

Welcome!  This Vagrant dev box was created with the intention of mirroring the iVillage production server environment as closely as possible, and to create a standardized development environment for all techies.  Since this is hosted on GitHub, environment enhancements and fixes can be distributed simply by performing a 'git pull' and then 'vagrant provision'.

System Requirements:
--------------------
Host computer must have at a minimum:
   - 4GB RAM
   - 64 bit operating system (Mac OS X or Linux highly recommended)

Download and install these:
   - VirtualBox 4.2.12: <https://www.virtualbox.org/wiki/Download_Old_Builds_4_2>
   - Vagrant 1.2.4:  <http://downloads.vagrantup.com/tags/v1.2.4>
   - Git: <http://git-scm.com/downloads>
   - Recommended if you are running Windows: <http://cygwin.com/setup-x86_64.exe>

* Note the above version numbers are important.  Problems have been found when upgrading to the latest versions of Vagrant and VirtualBox when they come out.

How to use this:
----------------
  1. Download and install the versions of VirtualBox and Vagrant listed previously.  Note that if you already have either of these installed, make sure you have the same versions to avoid problems.
  2. Choose a place on your drive where you would like the Vagrant box to live and check this code out via:

     `git clone http://github.com/reubidium/iv_devbox.git`

  3. Edit your local hosts file and add these lines (if these private IP addresses conflict on your network, you will need to change these settings in the VagrantFile):
```
     192.168.50.101 local.edit.ivillage.com local.api.ivillage.com local.cms.ivillage.com
     192.168.50.102 local.ivillage.com local.www.ivillage.com
     192.168.50.103 local.d7.ivillage.com
     192.168.50.104 local.mps.ivillage.com
```
  4. Check out via svn or git your desired project(s) into the iv\_devbox directory using the naming strategy described in the next section.
  5. In a Terminal, chdir into the iv\_devbox directory execute `vagrant up`
  6. The initial provisioning process can take awhile.  Should errors occur, try re-running via `vagrant provision`

Create desired environment directories
--------------------------------------
The box provisioning script will spin up a server each for iv6, iv7, vishnu, and/or mps if a matching directory is found within this directory.  Boxes will spin up only if a directory is found for the respective application.

Note: MySQL (Percona) is installed with a blank root password on all boxes.

Connecting via SSH
------------------
Use the `vagrant ssh <box_id>` command in your shell.  For example, `vagrant ssh iv6` to access the iv6 drupal box.

Note for Windows users: since Windows doesn't have ssh built in, this will not work and you will need to do a little hacking.  see <http://stackoverflow.com/questions/9885108/ssh-to-vagrant-box-in-windows> for a helpful discussion on this.

MySQL
-----
Note: The MySQL server is installed with a blank password for root.  To work with the database, you will either `vagrant ssh` in to the box, or tunnel in via SSH.

Staying current with new versions of this package
-------------------------------------------------
From time to time, new configuration versions will be released.  To apply these, simply do a `git pull` followed by `vagrant reload`.  It's that simple!

Other Vagrant commands
----------------------
  - `vagrant help`
  - `vagrant up`
  - `vagrant halt`
  - `vagrant reload`

Notes for Windows systems
-------------------------
It is recommended that you install and use Cygwin to interact with Vagrant.  Download it from the link above, and during the installation process make sure to select the following packages:
  - git
  - subversion
  - vim
  - openssh

Interested in learning more?
----------------------------
Check out the following websites:
<http://docs.vagrantup.com/v2/getting-started/index.html>
<http://docs.puppetlabs.com/#puppetpuppet>
