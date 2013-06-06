class php::files {
  file { "/etc/php.ini":
    source => "puppet:///modules/php/$environment/etc/php.ini",
    notify => Service["httpd"],
    require => Class["php::packages"],
    owner => root,
    group => root,
    mode => '0644',
  }

  file { "/etc/php.d":
    source => "puppet:///modules/php/$environment/etc/php.d",
    ensure => directory,
    notify => Service["httpd"],
    require => Class["php::packages"],
    owner => root,
    group => root,
    mode => '0555',
  }
  
  file { "/etc/bashrc.d/php52.sh":
    source => "puppet:///modules/php/$environment/etc/bashrc.d/php52.sh",
    require => Class["bashrc::rhel"],
    owner => root,
    group => root,
    mode => '0555',
  }   
}
