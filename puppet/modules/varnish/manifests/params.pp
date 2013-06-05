class varnish::params {
  $varnish_port = 8088
  $cache_size = "128M"
  $http_port = 80
  $http_host = "local.ivillage.com"
  $director_type = "round-robin"
  $connect_timeout = "60s"
  $health_check_url = "/misc/drupal.js"
  $health_check_timeout = "5s"
  $health_check_interval = "10s"
  $health_check_window = 10
  $health_check_threshold = 8
  $min_threads = 100
  $max_threads = 800
}
