notify{'Message 1':}
notify{'Message 2':}
notify{'Message 3':}
notify{'Message 4':}
notify{'Message 5':}

Notify['Message 1']->Notify['Message 5']->Notify['Message 3']->Notify['Message 1']

#notify{'Message 1':}->
#notify{'Message 2':}->
#notify{'Message 3':}->
#notify{'Message 4':}->
#notify{'Message 5':}

#notify{'Message 1':
#       before => Notify['Message 2']}
#notify{'Message 2':
#       before => Notify['Message 3']}
#notify{'Message 3':
#       before => Notify['Message 4']}
#notify{'Message 4':
#       before => Notify['Message 5']}
#notify{'Message 5':}

#notify{'Message 1':
#       require => Notify['Message 2']}
#notify{'Message 2':
#       require => Notify['Message 3']}
#notify{'Message 3':
#       require => Notify['Message 4']}
#notify{'Message 4':
#       require => Notify['Message 5']}
#notify{'Message 5':}
