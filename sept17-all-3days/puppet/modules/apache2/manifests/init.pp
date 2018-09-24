#class apache2($apache_port) inherits apache2::params {
# class{'apache2': apache_port => 8080}
# if user doesnt pass 8080 --- error out

#class apache2($apache_port=80) inherits apache2::params {
# include apache2 -- value of apache_port = 80
# class{'apache2': apache_port => 8080} -- value of apache_port = 8080

class apache2($apache_port=80) inherits apache2::params {
   notify{'In the class apache2':}
   #exec{'update cache':
   # command => 'apt-get update',
   # path => ['/usr/bin']
   #}
   include apache2::php

   package{'apache2':}
   service{'apache2': ensure=>running, enable=>true}
   file {'/var/www/html/index.html':
      ensure => present,
      source => 'puppet:///modules/apache2/index.html'
   }
   file {'/etc/apache2/ports.conf':
      content => template('apache2/ports.conf.erb')
   }

  #Exec['update cache']-> 
  Package['apache2'] -> File['/var/www/html/index.html']
  Package['apache2'] -> Service['apache2']
  Package['apache2'] -> File['/etc/apache2/ports.conf']
  File['/etc/apache2/ports.conf'] ~> Service['apache2']
  Package['apache2']->Class['apache2::php']~> Service['apache2']
}
