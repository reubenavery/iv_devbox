class phpmyadmin {
  exec { "download phpmyadmin":
    cwd => "/opt/ivillage",
    command => "/usr/bin/wget -c http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/3.4.9/phpMyAdmin-3.4.9-english.tar.gz",
    creates => "/opt/ivillage/phpMyAdmin-3.4.9-english.tar.gz",
  }

  exec { "unzip phpmyadmin":
    cwd => "/opt/ivillage",
    command => "/bin/tar xzf /opt/ivillage/phpMyAdmin-3.4.9-english.tar.gz",
    creates => "/opt/ivillage/phpMyAdmin-3.4.9-english",
    require => Exec["download phpmyadmin"],
  }

  file { "phpmyadmin config":
    path => "/opt/ivillage/phpMyAdmin-3.4.9-english/config.inc.php",
    source => "puppet:///modules/phpmyadmin/$environment/config.inc.php",
    require => Exec["unzip phpmyadmin"],
  }
}
