class confs($peru = $peru) inherits confs::params{
  if $::memavail < 300 {
     notify{"restart apache2 $::memavail":}
  }
  if $::boxrole == 'webserver' {
  	notify{"install pacakges related to $::boxrole machine":}
  }
  if $::boxrole == 'dbserver' {
  	notify{"install pacakges related to $::boxrole machine":}
  }

  notify{"$peru":}
  file {'/tmp/helloworld.txt':
    content => template('confs/helloworld.txt.erb'),
    ensure => present
  }
  #notify{"apache_port ${apache_port}":}
  #include confs::params
  #notify{"apache port ${confs::params::apache_port}":}
  #$osfamily = "RHEL"
  #notify{"osfamily is ${osfamily}":}->
  #notify{"osfamily is ${::osfamily}":}->
  #notify{"operatingsystem is ${operatingsystem}":}->
  #notify{"ipaddress is ${ipaddress}":}
  #$msg = "Hello World"
  #notify{"Message 1": 
  #    message => $msg
  #}-> 
  #notify{"Message 2 ${msg}": }->
  #notify{'Message 3 ${msg}': } 
}
