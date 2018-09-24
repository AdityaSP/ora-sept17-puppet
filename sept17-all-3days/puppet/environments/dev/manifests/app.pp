node nodep1{
	$myval = hiera('myval')
	notify{"inthis $myval":}
	include apache2
}
node nodep2{
	$myval = hiera('myval')
	notify{"inthis $myval":}
	include apache2
}
