class drush::packages {
  # Upgrade PEAR to 1.9.2+ so it can use pear.drush.org without complaint.
  pear::package { "PEAR": }
  pear::package { "Console_Table": }
  
  # Version numbers are supported.
  # Also, make sure PEAR is upgraded before trying to install drush.
  if $environment == 'drupal6' {
    pear::package { "drush":
      version => "5.0.0",
      repository => "pear.drush.org",
      require => [ Pear::Package["PEAR"], Pear::Package["Console_Table"] ],      
    }
  }
  else {
    pear::package { "drush": 
      repository => "pear.drush.org",
      require => [ Pear::Package["PEAR"], Pear::Package["Console_Table"] ],      
    }
  }
  
  # Just in case the NBC proxy page gets caught in our PEAR cache!
  # for the iv6 environ:
  exec { "/opt/ivillage/gnu/php/bin/pear clear-cache":
    unless => "/opt/ivillage/gnu/php/bin/pear remote-info pear.php.net/PEAR",
    onlyif => '/usr/bin/test -e /opt/ivillage/gnu/php/bin/pear',
    require => Pear::Package["PEAR"],
  }
  exec { "/usr/bin/pear clear-cache":
    unless => "/usr/bin/pear remote-info pear.php.net/PEAR",
    onlyif => '/usr/bin/test -e /usr/bin/pear',
    require => Pear::Package["PEAR"],
  }  
}
