class air::setup {
  exec { 'apt-get-update':
    command => '/usr/bin/apt-get update',
    user => 'root'
  }

  package { 'openjdk-7-jre': 
    require => Exec['apt-get-update']
  }
}
