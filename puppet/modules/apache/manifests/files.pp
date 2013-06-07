class apache::files {
  file { "/etc/httpd/conf.d/vhosts.conf":
    ensure => file,
    content => template("${module_name}/vhosts.conf.erb"),
    notify => Service["httpd"],
    require => [ Package["httpd"], File["/opt/ivillage"] ],
  }
  
  file { "/etc/httpd/conf.d/apache-tuning.conf":
    ensure => present,
    source => "puppet:///modules/apache/$environment/apache-tuning.conf",
    notify => Service["httpd"],
    require => Package["httpd"],
  }
  
  file { "/opt/ivillage":
    ensure => directory,
    owner => 'apache',
    group => 'apache',
    notify => [ Service["httpd"], Exec["make-webdir-readable"] ],
  }
  
  exec { "make-webdir-readable":
    command => "/bin/chmod -R o+rwX /opt/ivillage"
  }
}
