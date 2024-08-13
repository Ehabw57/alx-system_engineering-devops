# fix a wordpress website that always return 500 error code

exec { 'Fix-wordpress':
  command  => 'sudo sed -i "s/.phpp/.php/" /var/www/html/wp-settings.php',
  provider => shell,
}
