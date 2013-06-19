class php52 {
  include php52::packages
  include php52::files
  
  # When provisioning a d6 site from scratch, we need to create a symlink to 
  # pear in a standard place otherwise the pear provider will fail.
  exec { "/bin/ln -s /opt/ivillage/gnu/php/bin/pear /usr/bin/pear" :
    creates => "/usr/bin/pear",
    require => Package["php52"],
  }
}