# Configure ssh client to use private key and refuse password authentication

# Path to SSH client configuration file
$ssh_config_path = "/etc/ssh/ssh_config"

# Ensure ssh client configuration file exists
file { 'ssh_config':
  ensure => 'present',
  path   => $ssh_config_path,
}

# Turn off password authentication
file_line { 'Turn off passwd auth':
  ensure  => 'present',
  path    => $ssh_config_path,
  line    => 'PasswordAuthentication no',
  replace => true,
}

# Declare identity private key file
file_line { 'Declare identity file':
  ensure  => 'present',
  path    => $ssh_config_path,
  line    => 'IdentityFile ~/.ssh/school',
  replace => true,
}
