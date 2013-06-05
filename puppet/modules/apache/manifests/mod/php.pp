class apache::mod::php {
  include apache::params
  apache::mod { 'php52': }
  file { "${apache::params::vdir}/php.conf":
    ensure  => present,
    content => template('apache/mod/php.conf.erb'),
  }
}
