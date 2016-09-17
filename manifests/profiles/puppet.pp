#
# Puppet configuration for my Raspberry Pi.
#
# ## Parameters
#
# version: The version of Puppet to install.
#
class raspberrypi_baseline::profiles::puppet($version = 'latest') {

  file { '/etc/apt/sources.list.d/puppet.list':
    ensure => file,
    before => Package['puppet-agent']
  }

  # We'll use Puppet-Agent, which is the name used for Puppet > 4
  package { 'puppet-agent':
    ensure => $version,
  }

  # Default configuration for files.
  File {
    ensure   => file,
    owner    => 'root',
    group    => 'root',
    mode     => '0644',
    require  => Package['puppet-agent'],  
  }

  # Create some config files.
  file {
    $::settings::config:
      content  => template('raspberrypi_baseline/puppet/puppet.conf.erb');

    $::settings::hiera_config: 
      content  => template('raspberrypi_baseline/puppet/hiera.yaml.erb'),
  }

  # We're not using the Puppet Agent daemon (running master-less).
  service { 'puppet':
    ensure  => stopped,
    enable  => false,
    require => Package['puppet'],
  }

  # Puppet-Related Ruby Gems

  package { ['puppet-lint', 'rake', 'rspec-puppet']:
    ensure   => latest,
    provider => gem,
  }

}