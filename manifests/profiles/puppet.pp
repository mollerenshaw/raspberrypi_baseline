
class raspberrypi_baseline::profiles::puppet($version = 'latest') {
	
  package { 'puppet':
    ensure => $version,
  }

  File {
    ensure   => file,
    owner    => 'root',
    group    => 'root',
    mode     => '0644',
    require  => Package['puppet'],  
  }

  file {
    '/etc/puppet/puppet.conf':
      content  => template('raspberrypi_baseline/puppet/puppet.conf.erb');

    '/etc/puppet/hiera.yaml': 
      content  => template('raspberrypi_baseline/puppet/hiera.yaml.erb'),
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