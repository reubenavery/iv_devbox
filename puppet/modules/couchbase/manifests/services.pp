class couchbase::services {
  service { "couchbase-server":
    ensure => running,
    enable => true,
  }
}
