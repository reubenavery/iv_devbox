class percona::repositories {
  yumrepo { "Percona":
    baseurl => "http://repo.percona.com/centos/\$releasever/os/\$basearch/",
    descr => "Percona Repo",
    enabled => 1,
    gpgcheck => 0,
  }
}
