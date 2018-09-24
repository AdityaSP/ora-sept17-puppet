node /^nodep[0-9]+$/ {
	notify{'running':}
	#include apache2

	$hiera_port = hiera('port')

	class{'apache2::install':}->
	class{'apache2::configure':
		port => $hiera_port
	}~>
	class{'apache2::service':} ->

	package {'git':
		ensure => installed
	}->
	vcsrepo {'/tmp/code':
		ensure => latest,
		provider => git,
		source => 'https://github.com/AdityaSP/ora30'
	}->
	file {'filecopy':
		path => '/var/www/html/mypage.html',
		source => '/tmp/code/mypage.html'
	}
}

node default {

	notify{"Un Implemented":}

}
