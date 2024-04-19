# create a file school

file {'shcool':
  path => '/tmp/shcool',
  content => 'I love Puppet',
  owner => 'www-data',
  group => 'www-data',
  mode => '0744',
}
