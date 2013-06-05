class percona::packages {
  package { "Percona-Server-shared-compat" :
    ensure => installed,
    require => Class["percona::repositories"],
  }

  package { [ "Percona-Server-server-55", "Percona-Server-client-55" ]:
    ensure => installed,
    require => Package["Percona-Server-shared-compat"],
  }
}
