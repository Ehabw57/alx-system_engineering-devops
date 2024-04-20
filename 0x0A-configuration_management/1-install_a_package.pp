# installs flask version 2.1.0

 package {'falsk':
   ensure   => '2.1.0',
   name     => 'flask',
   provider => 'pip3',
 }

 package {'Werkzeug':
   ensure   => '2.1.1',
   name     => 'werkzeug',
   provider => 'pip3',
 }

