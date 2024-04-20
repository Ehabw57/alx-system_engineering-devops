# Configure client side of the server using Puppet
file { 'ssh_config':
  ensure => 'present',
  path   => '~/.ssh/ssh_config',
}

# Turn off password authentication line
file_line { 'Turn off password auth':
  ensure  => 'present',
  path    => '~/.ssh/ssh_config',
  line    => 'BatchMode yes',
  replace => true,
  require => File['ssh_config'],
}

# Declare identity private key file to login
file_line { 'Declare identity':
  ensure  => 'present',
  path    => '~/.ssh/ssh_config',
  line    => 'IdentityFile ~/.ssh/school',
  replace => true,
  require => File['ssh_config'],
}
