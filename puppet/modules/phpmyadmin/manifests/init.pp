class phpmyadmin {
  exec { "download phpmyadmin":
    cwd => "/opt/ivillage",
    command => "/usr/bin/wget -c http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.0.3/phpMyAdmin-4.0.3-all-languages.tar.gz?r=http%3A%2F%2Fwww.phpmyadmin.net%2Fhome_page%2Fdownloads.php&ts=1370544945&use_mirror=iweb",
    creates => "/opt/ivillage/phpMyAdmin-4.0.3-all-languages.tar.gz",
  }

  exec { "unzip phpmyadmin":
    cwd => "/opt/ivillage",
    command => "/bin/tar xzf /opt/ivillage/phpMyAdmin-4.0.3-all-languages.tar.gz",
    creates => "/opt/ivillage/phpMyAdmin-4.0.3-all-languages",
    require => Exec["download phpmyadmin"],
  }

  file { "phpmyadmin config":
    path => "/opt/ivillage/phpMyAdmin-4.0.3-all-languages/config.inc.php",
    content => template("${module_name}/config.inc.php.erb"),
    require => Exec["unzip phpmyadmin"],
  }
}
