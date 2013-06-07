#
# Main Puppet manifest for ivillage-drupal6 vagrant dev box
#

class { 'selinux': 
  mode => 'permissive'
}

# Prevent an error in Puppet 2.7 with `puppet apply` when the puppet user
# and group do not exist.
group { "puppet":
  ensure => present,
  gid => 24,
}

user { "puppet":
  ensure => present,
  uid => 24,
  gid => 24,
  home => "/var/lib/puppet",
  managehome => true,
  require => Group["puppet"],
}

# We don't want no stinkin' iptables on our locals.
service { "iptables" :
  ensure => stopped,
  enable => false,
  hasstatus => true,
}

class { 'yum': }
class { 'motd': }
class { 'bashrc': }
class { 'apache': }
class { 'percona': }
class { 'couchbase': }
class { 'php53': }
class { 'pear': }

# Open up httpd log directory access for easy viewing.
file { "/var/log/httpd" :
  mode => "0755",
  require => Class["apache"],
}
