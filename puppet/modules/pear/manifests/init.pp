class pear(
  $package = $pear::params::package
) inherits pear::params {

  # Install the PEAR package.
  package { $package:
    ensure => installed,
    notify => [ Exec['pear-channel-update'], Exec['pear-channel-update-iv6'] ],
  }
  
  
  exec { 'pear-channel-update-iv6':
    command => '/opt/ivillage/gnu/php/bin/pear channel-update pear.php.net',
    onlyif => '/usr/bin/test -e /opt/ivillage/gnu/php/bin/pear',
  }
  
  exec { 'pear-channel-update':
    command => "/usr/bin/pear channel-update pear.php.net && touch /etc/puppet/channel_update_ran",
    creates => '/etc/puppet/channel_update_ran',
    onlyif => '/usr/bin/test -e /usr/bin/pear',    
  }  
}

