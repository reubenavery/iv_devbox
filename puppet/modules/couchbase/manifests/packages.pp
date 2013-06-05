class couchbase::packages {
  # Install prereqs for couchbase server.
  package { [ "openssl", "zlib-devel" ]:
    ensure => installed,
  }

  package { "couchbase-server":
    ensure => installed,
    source => "http://packages.couchbase.com/releases/1.8.1/couchbase-server-community_x86_64_1.8.1.rpm",
    provider => "rpm",
    require => [ Package["openssl"], Package["zlib-devel"] ],
  }
}
