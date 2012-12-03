class air::install {
  file{'install-air.sh':
          path => '/home/vagrant/install-air.sh',
          ensure => present,
          source => 'puppet:///modules/air/install/install-air.sh',
          owner => vagrant,
          group => vagrant,
          mode  => 744,
          require => Class['air::setup']
  }

  exec { 'install-air': 
    command => "/home/vagrant/install-air.sh",
    timeout => 0,
    require => File['install-air.sh'],
    user => vagrant
  }
}
