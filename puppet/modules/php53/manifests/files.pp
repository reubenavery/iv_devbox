class php53::files {
  file { "/etc/php.ini":
    ensure => file,
    checksum => md5,
    source => "puppet:///modules/php53/php.ini",
    notify => Service["httpd"],
    require => Class["php53::packages"],
    owner => root,
    group => root,
    mode => '0644',
  }
}