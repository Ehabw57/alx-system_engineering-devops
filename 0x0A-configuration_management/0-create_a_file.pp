# create a file school

file {'/tmp/shcool':
  content => 'I love Puppet',
  owner => 'www-data',
  group => 'www-data',
  mode => '0744',
}
