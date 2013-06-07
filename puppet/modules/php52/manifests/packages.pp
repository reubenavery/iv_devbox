class php52::packages {
  # Install prereqs for PHP.
  package { [ "freetype", "libxslt-devel", "libjpeg", "libmcrypt", "libpng", "libtidy", "libtool-ltdl" ]:
    ensure => installed,
  }
  
  package { "php52":
    name => "php52",
    ensure => installed,
    source => [ "/vagrant/puppet/modules/php52/lib/php52-5.2.17-1.x86_64.rpm", "/vagrant/puppet/modules/php52/lib/php52-5.2.17-2.x86_64.rpm", "/vagrant/puppet/modules/php52/lib/php52-5.2.17-3.x86_64.rpm" ],
    provider => "rpm",
    require => [ Class["percona"], Package["freetype"], Package["libxslt-devel"], Package["libjpeg"], Package["libmcrypt"], Package["libpng"], Package["libtidy"], Package["libtool-ltdl"] ],
    notify => Exec["php52_cleanup"],
  }  
  
  package { "php52-pear-xml_serializer": 
    name => "php52-pear-xml_serializer",
    ensure => installed,
    source => "/vagrant/puppet/modules/php52/lib/php52-pear-xml_serializer-0.20.2-3.1.noarch.rpm",
    provider => "rpm",
    require => [ Package["php52"] ]
  }
  
  exec { "php52_cleanup":
    command => "/vagrant/scripts/php_cleanup.sh", 
    onlyif => '/usr/bin/test -f /etc/php.d/bcmath.ini',
  }
  
  #exec { "php52_create_session_dir":
  #  command => "/bin/ln -s /opt/ivillage/gnu/php/lib/php /var/lib/php && /bin/mkdir /var/lib/php/session && /bin/chown apache:apache /var/lib/php/session",
  #  onlyif => "/usr/bin/test ! -d /var/lib/php/session"
  #}
}