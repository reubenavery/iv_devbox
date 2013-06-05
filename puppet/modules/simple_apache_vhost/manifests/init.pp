class simple_apache_vhost (
  $http_port       = undef,
  $https_port      = undef,
  $ssl_key         = "puppet:///modules/simple_apache_vhost/ssl.key.${fqdn}",
  $ssl_pem         = "puppet:///modules/simple_apache_vhost/ssl.pem.${fqdn}",
  $base_path       = "/var/www",
  $redirect_to_ssl = true,
  $http_options    = undef,
  $https_options   = undef,
  $http_override   = undef,
  $https_override  = undef
) {
  case $operatingsystem {
    debian, ubuntu: {
      $httpd_package  = "apache2"
      $ssl_source     = "apache2.2-common"
      $rewrite_source = "apache2.2-common"
      $conf_dir       = "/etc/apache2"
      $enable_ssl     = "/usr/sbin/a2enmod ssl"
      $mod_ssl        = "${conf_dir}/mods-enabled/ssl"
      $enable_rewrite = "/usr/sbin/a2enmod rewrite"
      $mod_rewrite    = "${conf_dir}/mods-enabled/rewrite"
      $enable_php     = "/usr/sbin/a2enmod php5"
      $php_source     = "libapache2-mod-php5"
      $mod_php        = "${conf_dir}/mods-enabled/php5"
      $ports_path     = "${conf_dir}/ports.conf"
      $vhost_path     = "${conf_dir}/sites-available/default"
      $vhost_link     = "${conf_dir}/sites-enabled/default"
      $ssl_key_path   = "${conf_dir}/ssl/ssl.key"
      $ssl_pem_path   = "${conf_dir}/ssl/ssl.pem"
    }
    default: { fail("Parameters for this OS have not been specified.") }
  }

  if $http_port == undef {
    $http_port_final = "80"
  }
  else {
    $http_port_final = $http_port
  }

  if $https_port == undef {
    $https_port_final = "443"
  }
  else {
    $https_port_final = $https_port
  }

  if $http_override == undef {
    $http_override_final = ["None"]
  }
  else {
    $http_override_final = $http_override
  }

  if $https_override == undef {
    $https_override_final = ["All"]
  }
  else {
    $https_override_final = $https_override
  }  

  if $http_options == undef {
    $http_options_final = ["FollowSymlinks", "MultiViews"]
  }
  else {
    $http_options_final = $http_options
  }

  if $https_options == undef {
    $https_options_final = ["FollowSymlinks", "MultiViews"]
  }
  else {
    $https_options_final = $http_options
  }

  package { $php_source:
    ensure => installed
  }

  package { "httpd":
    name   => $httpd_package,
    ensure => installed
  }

  if $ssl_source != $rewrite_source {
    package { $ssl_source:
      ensure => installed
    }

    package { $rewrite_source:
      ensure => installed
    }
  }
  else {
    package { $ssl_source:
      ensure => installed
    }
  }

  exec { "enable php5":
    command => $enable_php,
    cwd     => "/etc/apache2/",
    path    => ["/sbin", "/usr/sbin", "/usr/local/sbin", "/bin", "/usr/bin", "/usr/local/sbin"],
    user    => "root",
    onlyif  => "test -L ${mod_php}",
    require => Package[$php_source]
  }

  exec { "enable ssl":
    command => $enable_ssl,
    cwd     => "/etc/apache2/",
    path    => ["/sbin", "/usr/sbin", "/usr/local/sbin", "/bin", "/usr/bin", "/usr/local/sbin"],
    user    => "root",
    onlyif  => "test -L ${mod_ssl}",
    require => Package[$ssl_source]
  }

  exec { "enable rewrite":
    command => $enable_rewrite,
    cwd     => "/etc/apache2/",
    path    => ["/sbin", "/usr/sbin", "/usr/local/sbin", "/bin", "/usr/bin", "/usr/local/sbin"],
    user    => "root",
    onlyif  => "test -L ${mod_rewrite}",
    require => Package[$rewrite_source]
  }

  file { "ports":
    path    => $ports_path,
    require => Package[$httpd_package],
    owner   => "root",
    group   => "root",
    mode    => "0644",
    content => template("simple_apache_vhost/ports.erb")
  }

  file { "${conf_dir}/ssl":
    ensure => directory,
    owner  => "root",
    group  => "root",
    mode   => "0755"
  }

  file { 'ssl.key':
    path    => $ssl_key_path,
    source  => [$ssl_key, "puppet:///modules/simple_apache_vhost/ssl.key"],
    owner   => "root",
    group   => "root",
    mode    => "0644",
    require => File["${conf_dir}/ssl"]
  }

  file { 'ssl.pem':
    path   => $ssl_pem_path,
    source => [$ssl_pem, "puppet:///modules/simple_apache_vhost/ssl.pem"],
    owner  => "root",
    group  => "root",
    mode   => "0644",
    require => File["${conf_dir}/ssl"]
  }

  file { "vhost":
    path    => $vhost_path,
    require => Package[$httpd_package],
    owner   => "root",
    group   => "root",
    mode    => "0644",
    content => template("simple_apache_vhost/vhost.erb")
  }

  file { "vhost-link":
    path => $vhost_link,
    ensure => link,
    owner => "root",
    group => "root",
    target => $vhost_path
  }

  service { 'apache2 httpd':
    name => $httpd_package,
    ensure => running,
    enable => true,
    require => [Exec['enable php5'], Exec['enable ssl'], Exec['enable rewrite'], File['ports'], File['ssl.key'], File['ssl.pem'], File['vhost'], File['vhost-link']]
  }
}
