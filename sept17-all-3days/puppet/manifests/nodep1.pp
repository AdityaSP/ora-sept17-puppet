node nodep1 {
  notify{'Anything specific to nodep1':}
# include apache2
  class{'apache2':
    apache_port => 8082
 }
}
