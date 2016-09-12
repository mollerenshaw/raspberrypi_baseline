
class raspberrypi_baseline::profiles::docker($version = 'latest') {

  package { ['apt-transport-https', 'ca-certificates'] :
    ensure => latest,
    before => Package['docker'],
  }

  $distro_codename = $facts['os']['lsb']['distcodename']

  file { '/etc/apt/sources.list.d/docker.list' :
    ensure  => file,
    content => template('raspberrypi_baseline/docker/docker.list.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    before  => Package['docker'],
  }

  exec { 'add_docker_apt_key' :
    command => '/usr/bin/apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D',
    before  => Package['docker-engine'],
  }

  package { 'docker-engine' :
    ensure => $version,
  }

  service { 'docker' :
    ensure    => running,
    enable    => true,
    subscribe => Package['docker-engine'],
  }
}
