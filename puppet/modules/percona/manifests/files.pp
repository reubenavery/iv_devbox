class percona::files {
  file { "/etc/my.cnf":
    ensure => file,
    content => template("${module_name}/my.cnf.erb"),
    require => Class["percona::packages"],
    owner => 'root',
    group => 'root',
    mode => '0644'
  }
}
