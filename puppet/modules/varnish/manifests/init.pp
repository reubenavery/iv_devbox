class varnish (
  $varnish_port = $varnish::params::varnish_port,
  $cache_size = $varnish::params::cache_size,
  $http_port = $varnish::params::http_port,
  $http_host = $varnish::params::http_host,
  $director_type = $varnish::params::director_type,
  $connect_timeout = $varnish::params::connect_timeout,
  $health_check_url = $varnish::params::health_check_url,
  $health_check_timeout = $varnish::params::health_check_timeout,
  $health_check_interval = $varnish::params::health_check_interval,
  $health_check_window = $varnish::params::health_check_window,
  $health_check_threshold = $varnish::params::health_check_threshold,
  $min_threads = $varnish::params::min_threads,
  $max_threads = $varnish::params::max_threads,
  $backends
) inherits varnish::params {
  include varnish::repositories
  include varnish::packages
  class { "varnish::files" :
    varnish_port => $varnish_port,
    cache_size => $cache_size,
    http_port => $http_port,
    http_host => $http_host,
    director_type => $director_type,
    connect_timeout => $connect_timeout,
    health_check_url => $health_check_url,
    health_check_timeout => $health_check_timeout,
    health_check_interval => $health_check_interval,
    health_check_window => $health_check_window,
    health_check_threshold => $health_check_threshold,
    min_threads => $min_threads,
    max_threads => $max_threads,
    backends => $backends,
  }
  include varnish::services

  Class["varnish::repositories"] -> Class["varnish::packages"] -> Class["varnish::files"] -> Class["varnish::services"]
}
