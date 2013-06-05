class varnish::repositories {
  yumrepo { "varnish":
    baseurl => "http://repo.varnish-cache.org/redhat/varnish-3.0/el5/\$basearch/",
    descr => "YUM releases for Varnish 3",
    enabled => 1,
    gpgcheck => 0,
  }
  yumrepo { 'EPEL': 
    baseurl => "http://dl.fedoraproject.org/pub/epel/5/\$basearch/",
    descr => "Extra Packages for Enterprise Linux",
    enabled => 1,
  }
}
