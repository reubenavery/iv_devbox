class php::packages {
  # Install prereqs for PHP.
  package { [ "freetype", "libxslt-devel", "libjpeg", "libmcrypt", "libpng", "libtidy", "libtool-ltdl" ]:
    ensure => installed,
  }
  
  package { "php52":
    name => "php52",
    ensure => installed,
    source => [ "/vagrant/puppet/modules/php/lib/php52-5.2.17-1.x86_64.rpm", "/vagrant/puppet/modules/php/lib/php52-5.2.17-2.x86_64.rpm", "/vagrant/puppet/modules/php/lib/php52-5.2.17-3.x86_64.rpm" ],
    provider => "rpm",
    require => [ Class["percona"], Package["freetype"], Package["libxslt-devel"], Package["libjpeg"], Package["libmcrypt"], Package["libpng"], Package["libtidy"], Package["libtool-ltdl"] ],
  }  
  
  package { "php52-pear-xml_serializer": 
    name => "php52-pear-xml_serializer",
    ensure => installed,
    source => "/vagrant/puppet/modules/php/lib/php52-pear-xml_serializer-0.20.2-3.1.noarch.rpm",
    provider => "rpm",
    require => [ Package["php52"] ]
  }
  
  exec { "php_cleanup":
    command => "/vagrant/scripts/php_cleanup.sh", 
    onlyif => '/usr/bin/test -f /etc/php.d/bcmath.ini'
  }   
}