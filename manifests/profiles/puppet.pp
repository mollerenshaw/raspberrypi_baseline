
class raspberrypi_baseline::profiles::puppet($version = 'latest') {
	
  package { 'puppet':
    ensure => $version,
  }

  file { '/etc/puppet/puppet.conf':
    ensure   => file,
    contents => template('raspberrypi_baseline/puppet/puppet.conf.erb'),
    owner    => 'root',
    group    => 'root',
    mode     => '0644',
    require  => Package['puppet'],
  }

  service { 'puppet':
    ensure  => stopped,
    enable  => false,
    require => Package['puppet'],
  }

  # Puppet-Related Ruby Gems

  package { ['puppet-lint', 'rake', 'rspec-puppet']:
    ensure => latest,
  }

}