node /nodep[1-9]/ {
  if $::boxrole == "webserver"{
    #  package{'git':}
      class{'apache2':
        apache_port => hiera('apache_port')
      }
    #  vcsrepo { '/var/www/html/proj':
    #    ensure   => latest,
    #    provider => git,
    #    source   => 'https://github.com/AdityaSP/puppetcode',
    #    revision => 'master',
    #  }
    
    #  Package['git']->Vcsrepo['/var/www/html/proj']
    #  Class['apache2']->Vcsrepo['/var/www/html/proj']
  }
  if $::boxrole == "dbserver"{
    notify{"Installation for dbserver":}
    include mysql
  }
  
}
