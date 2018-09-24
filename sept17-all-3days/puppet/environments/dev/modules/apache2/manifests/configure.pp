class apache2::configure{
	file {'apache conf':
		path => '/etc/apache2/ports.conf',
		source => 'puppet:///modules/apache2/ports.conf'
	}
}
