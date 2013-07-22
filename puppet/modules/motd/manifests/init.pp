class motd {
 File { owner => 0, group => 0, mode => 0644 }

 file { "/etc/motd":
   ensure => file,
   content => template("${module_name}/motd.erb")
 }
}
