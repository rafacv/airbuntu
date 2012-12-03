class air::install {
  file{'install-air.sh':
          path => '/root/install-air.sh',
          ensure => present,
          source => 'puppet:///modules/air/install/install-air.sh',
          owner => root,
          mode  => 744,
          require => Class['air::setup']
  }

  exec { 'install-air': 
    command => "/root/install-air.sh",
    timeout => 0,
    require => File['install-air.sh'],
    user => root
  }
}
