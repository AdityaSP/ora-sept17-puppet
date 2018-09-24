file {'/tmp/f1.txt':
    ensure => present, 
    content => "username=hello\npassword=tiger"
}

package {'apache2': }

service {'apache2': ensure=> stopped}
