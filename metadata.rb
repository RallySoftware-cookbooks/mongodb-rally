name             'mongodb-rally'
maintainer       'Rally Software Development Corp'
maintainer_email 'rallysoftware-cookbooks@rallydev.com'
license          'MIT'
description      'Installs/Configures mongodb-rally'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'mongodb-rally::default', 'Includes the client recipe by default'
recipe 'mongodb-rally::client', 'Installs mongo shell & client packages and tools'

supports 'centos'

depends 'yum', '~> 2.3.0'
