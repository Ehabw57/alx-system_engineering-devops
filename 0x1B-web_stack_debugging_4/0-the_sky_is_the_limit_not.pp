# Fix nginx file decriptor limitaions

exec { 'fix_nginx_limits' :
	command => 'sed -i "s/15/4096/" /etc/default/nginx',
	provider => shell
}

exec { 'nginx_restart' :
	command => 'service nginx restart',
	provider => shell,
	require => Exec['fix_nginx_limits']
}
