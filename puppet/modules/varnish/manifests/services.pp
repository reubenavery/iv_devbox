class varnish::services {
  service { "varnish" :
    enable => true,
    ensure => running,
    hasrestart => true,
  }

  service { "varnishncsa" :
    enable => false,
    ensure => stopped,
    hasrestart => true,
  }
}
