node /nodep[0-9]/ {
#   notify{'welcome to puppet server':}
   #include webserver
   $port = hiera('hieraport')
   class{'webserver': apacheport => $port}-> 
   package {'git':}->
   vcsrepo { '/tmp/myfile':
     ensure   => present,
     provider => git,
     source   => 'https://github.com/AdityaSP/puppetcode'
   }->
   file {'/var/www/html/index.html':
     source => '/tmp/myfile/index.html',
     ensure => present 
  }
}
