class apache2 {
   notify{'In the class apache2':}
   exec{'update cache':
    command => 'apt-get update',
    path => ['/usr/bin']
   }
   package{'apache2':}
   service{'apache2': ensure=>running, enable=>true}
   file {'/var/www/html/index.html':
      ensure => present,
      source => 'puppet:///modules/apache2/index.html'
   }

  Exec['update cache']-> 
  Package['apache2'] -> File['/var/www/html/index.html']
  Package['apache2'] -> Service['apache2']

}
