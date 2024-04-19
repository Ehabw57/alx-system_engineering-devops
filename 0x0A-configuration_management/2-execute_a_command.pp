# kills kill me process

exec {'killme':
  command => '/usr/bin/pkill killmenow',
}
