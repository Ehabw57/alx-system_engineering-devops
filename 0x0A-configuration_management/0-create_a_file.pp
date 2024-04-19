# create a file school

file {'/tmp/shcool':
  ensure => 'present',
  content => 'I love Puppet',
  owner => 'www-data',
  group => 'www-data',
  mode => '0744',
}
