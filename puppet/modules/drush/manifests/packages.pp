class drush::packages {
  # Upgrade PEAR to 1.9.2+ so it can use pear.drush.org without complaint.
  pear::package { "PEAR": }
  
  # Version numbers are supported.
  # Also, make sure PEAR is upgraded before trying to install drush.
  pear::package { "drush":
    version => "5.0.0",
    repository => "pear.drush.org",
    require => Pear::Package["PEAR"],
  }
  
  # Just in case the NBC proxy page gets caught in our PEAR cache!
  exec { "/opt/ivillage/gnu/php/bin/pear clear-cache":
    unless => "/opt/ivillage/gnu/php/bin/pear remote-info pear.php.net/PEAR",
    require => Pear::Package["PEAR"],
  }
}
