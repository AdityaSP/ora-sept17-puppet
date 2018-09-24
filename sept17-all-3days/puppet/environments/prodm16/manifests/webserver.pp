class webserver{
	notify{'welcome to dev webserver':}	
	class{'apache2':
		port => 9999
	}
	include apache2php
	service{'apache2': ensure => running}

	package{'git':}->
	vcsrepo { '/tmp/mycode':
  		ensure   => latest,
  		provider => git,
  		source   => 'https://github.com/AdityaSP/puppetcode'
	}->
	file{'copy':
		source=>'/tmp/mycode/mypage.php',
		path=>'/var/www/html/mypage.php'
	}

	Class['apache2']->Class['apache2php']
	Package['apache2']~>Service['apache2']
	File['/etc/apache2/ports.conf']~>Service['apache2']
	Class['apache2php']~>Service['apache2']
}
