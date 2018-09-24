class apache2::install{

	notify{'apache2 install':}

	package {'apache2':
		ensure=>installed
	}

}
