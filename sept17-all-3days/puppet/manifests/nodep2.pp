node nodep2 {
  notify{'Anything specific to nodep1':}
  class{'apache2':
    apache_port => 8082
 }
}
