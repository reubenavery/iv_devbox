# Add a define to allow installing pecl packages.
define pecl::package(
  $package = $title,
  $repository = "pecl.php.net",
  $version = "latest"
) {
  if $version != "latest" {
    $pecl_source = "${repository}/${package}-${version}"
  } else {
    $pecl_source = "${repository}/${package}"
  }

  # pecl is already part of RHEL's PHP
  if $::osfamily != 'RedHat' {
    package { "pecl-${repository}-${package}":
      name => $package,
      provider => "pecl",
      source => $pecl_source,
      ensure => $version,
      require => Class["pecl"],
    }
  }
}
