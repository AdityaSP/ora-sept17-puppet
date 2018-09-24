node default {

        if $::box == 'webserver' {

	    include webserver
	    $hiera_var = hiera('myhieravar')
	    notify{"${hiera_var} got this from hiera":} 

        } else {
	    include db
        }

}
