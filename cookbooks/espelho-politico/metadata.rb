name             'espelho-politico'
maintainer       'Universidade de Brasilia'
maintainer_email ''
license          'All rights reserved'
description      'Installs/Configures espelho-politico'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apache2"
depends "mysql", "4.1.2"
depends "ruby"
depends "database"
depends "mysql2_chef_gem"
