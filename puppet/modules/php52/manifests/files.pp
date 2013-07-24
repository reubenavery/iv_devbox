class php52::files {
  file { "/etc/php.ini":
    source => "puppet:///modules/php52/etc/php.ini",
    notify => Service["httpd"],
    require => Class["php52::packages"],
    owner => root,
    group => root,
    mode => '0644',
  }

  file { "/etc/php.d":
    source => "puppet:///modules/php52/php.d",
    ensure => directory,
    notify => Service["httpd"],
    require => Class["php52::packages"],
    owner => root,
    group => root,
    mode => '0555',
  }
  
  file { "/etc/bashrc.d/php52.sh":
    source => "puppet:///modules/php52/bashrc.d/php52.sh",
    ensure => file,
    require => Class["bashrc::rhel"],
    owner => root,
    group => root,
    mode => '0644',
  }   
}
