#!/usr/bin/puppet apply
# configre nginx server with puppet

$config="server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location /redirect_me {
                return 301 https://www.behance.net/EHABABDELRADY57;
        }

        error_page 404 /404.html;
        location = /404.html {
        root /var/www/html;
        internal;
        }
}\n"

exec { "apt-update":
	command => "apt-get update",
	path => "/usr/bin",
}

package { "nginx":
	ensure => "installed",
	require => Exec['apt-update'],
}

file {"/var/www/html/404.html":
	ensure => file,
	content => "Ceci n'est pas une page\n",
}

file {"/var/www/html/index.html":
	ensure => file,
	content => "Hello World!",
}

file {"/etc/nginx/sites-available/default":
	ensure => file,
	content => $config,
}

service {"nginx":
	ensure => 'running',
	enable => 'true',
	require => Package["nginx"],
	subscribe => [File['/var/www/html/index.html'], File['/var/www/html/404.html'],
  File['/etc/nginx/sites-available/default']],
}

