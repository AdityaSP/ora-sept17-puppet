class apache2::php{
  $packages = ['php5','php5-mysql', 'libapache2-mod-php5']
  notify{'In php':}->
  package{$packages:}
}
