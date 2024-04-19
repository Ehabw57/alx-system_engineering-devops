# installs flask version 2.1.0

 package {'falsk2.1.0':
   ensure => '2.1.0',
   name => 'flask',
   provider => 'pip3',
 }

