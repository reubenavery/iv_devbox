class yum {
    file { "/etc/yum.conf":
        group => "root",
        source => "puppet:///modules/yum/yum.conf"
    }
}
