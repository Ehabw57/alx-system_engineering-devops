# incleare holbirton user nuber of allowed fd

exec { 'increase_soft' :
	command => 'sed -i "s/nofile 5/nofile 30000/" /etc/security/limits.conf',
	provider => shell
}

exec { 'increase_hard' :
	command => 'sed -i "s/nofile 4/nofile 20000/" /etc/security/limits.conf',
	provider => shell
}
