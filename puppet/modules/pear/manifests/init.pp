class pear(
  $package = $pear::params::package
) inherits pear::params {

  # Install the PEAR package.  (it is already present in the php52 package for the drupal6 environment)
  if $environment != 'drupal6' {
    package { $package:
      ensure => installed,
    }
  }
}

