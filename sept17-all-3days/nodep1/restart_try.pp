service{'stop apache2': name=> 'apache2', ensure=>stopped}->
service{'start apache2': name=> 'apache2', ensure=>running}
