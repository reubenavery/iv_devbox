class php53::packages {
  package { [ "php", "php-devel", "php-cli", "php-gd", "php-mysql", "php-pecl-apc", "php-mbstring", "php-mcrypt", "php-tidy", "php-xml", "php-xmlrpc", "php-soap", "freetype", "libxslt-devel", "libjpeg-turbo", "libpng", "libtidy", "libtool-ltdl" ]:
    ensure => installed,
    notify => Service["httpd"],
  }
  
  package { [ "ImageMagick", "ImageMagick-devel" ]:
    ensure => installed,
  }
  
  package { "php-pecl-memcache":
    ensure => installed,
    require => Package["couchbase-server"],
  }
  
  package { ["php-pecl-imagick", "php-pecl-ssh2", "php-pecl-geoip" ] :
    ensure => installed,
    require => [ Package["php"], Package["ImageMagick"], Exec["grab-epel"] ],
    notify => Service["httpd"],
  }

  exec { "grab-epel":
    command => '/bin/rpm -ivh http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm',
    creates => '/etc/yum.repos.d/epel.repo'
  }
}