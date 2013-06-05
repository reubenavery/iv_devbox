class percona::services {
  service { "mysql":
    ensure => running,
    enable => true,
    hasrestart => true,
    subscribe => File["/etc/my.cnf"],
    require => Class["percona::files"],
  }
}
