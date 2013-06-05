class vagrant {
  # Specific tweaks that we envision will only be necessary for the purpose of running
  # Vagrant VMs. Normally, try to use $environment if there's a file that needs to be
  # different among the various environments (dev, stage, QA, production.)

  # @TODO: Break this up into sub-modules?

  # Prevent an error in Puppet 2.7 with `puppet apply` when the puppet user
  # and group do not exist.
  group { "puppet":
    ensure => present,
    gid => 24,
  }

  user { "puppet":
    ensure => present,
    uid => 24,
    gid => 24,
    home => "/var/lib/puppet",
    managehome => true,
    require => Group["puppet"],
  }

  # We don't want no stinkin' iptables on our locals.

  service { "iptables" :
    ensure => stopped,
    enable => false,
    hasstatus => true,
  }

  # Open up httpd log directory access for easy viewing.

  file { "/var/log/httpd" :
    mode => "0755",
    require => Class["apache"],
  }
}
