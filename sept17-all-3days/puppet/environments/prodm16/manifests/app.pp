node default {

        if $::box == 'webserver' {
	    include webserver
        } else {
	    include db
        }

}
