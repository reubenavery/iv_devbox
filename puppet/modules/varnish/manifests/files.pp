class varnish::files (
  $varnish_port,
  $cache_size,
  $http_port,
  $http_host,
  $director_type,
  $connect_timeout,
  $health_check_url,
  $health_check_timeout,
  $health_check_interval,
  $health_check_window,
  $health_check_threshold,
  $min_threads,
  $max_threads,
  $backends
) {
  File {
    ensure => present,
    owner => 0,
    group => 0,
    mode => 0400,
  }

  file { "/etc/varnish/default.vcl" :
    content => template("${module_name}/default.vcl.erb"),
    owner => root,
    group => root,
    mode => '0644',
    notify => Service["varnish"],
  }

  file { "/etc/sysconfig/varnish" :
    content => template("${module_name}/varnish-sysconfig.erb"),
    notify => Service["varnish"],
    owner => root,
    group => root,
    mode => '0644',
  }
}
