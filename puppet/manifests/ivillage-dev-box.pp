#
# Main Puppet manifest for ivillage-drupal6 vagrant dev box
#

class { 'selinux': 
  mode => 'permissive'
}

class { 'yum': }
class { 'motd': }
class { 'bashrc': }
class { 'apache': }
class { 'percona': }
class { 'varnish': 
  backends => [
    [ "localbackend", "127.0.0.1" ],
  ],
}
class { 'couchbase': }
class { 'php': }
class { 'pear': }
class { 'drush': }

