class percona::files {
  file { "/etc/my.cnf":
    ensure => present,
    source => "puppet:///modules/percona/$environment/my.cnf",
    require => Class["percona::packages"],
  }
}
