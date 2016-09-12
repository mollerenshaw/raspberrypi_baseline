
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

  package { 'docker-engine' :
    ensure => $version,
  }

  service { 'docker' :
    ensure    => running,
    enable    => true,
    subscribe => Package['docker-engine'],
  }
}
