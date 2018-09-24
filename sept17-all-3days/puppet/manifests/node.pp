node /nodep[1-9]/ {
  package{'git':}
  class{'apache2':
    apache_port => 8082
  }
  vcsrepo { '/var/www/html/proj':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/AdityaSP/puppetcode',
    revision => 'master',
  }

  Package['git']->Vcsrepo['/var/www/html/proj']
  Class['apache2']->Vcsrepo['/var/www/html/proj']
}
