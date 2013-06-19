class pecl(
  $package = $pecl::params::package
) inherits pecl::params {

  # Install the pecl package.
  package { $package:
    ensure => installed,
  }
}

