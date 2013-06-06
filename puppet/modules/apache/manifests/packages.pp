class apache::packages {
  package { "httpd":
    name => "httpd",
    ensure => installed,
  }
  
  exec { '/bin/rm /etc/httpd/conf.d/welcome.conf':
    onlyif => '/usr/bin/test -f /etc/httpd/conf.d/welcome.conf'
  }
}
