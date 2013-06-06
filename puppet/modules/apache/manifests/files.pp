class apache::files {
  file { "/etc/httpd/conf.d/vhosts.conf":
    ensure => file,
    content => template("${module_name}/vhosts.conf.erb"),
    notify => Service["httpd"],
    require => Package["httpd"],
  }
  file { "/etc/httpd/conf.d/apache-tuning.conf":
    ensure => present,
    source => "puppet:///modules/apache/$environment/apache-tuning.conf",
    notify => Service["httpd"],
    require => Package["httpd"],
  }
}
