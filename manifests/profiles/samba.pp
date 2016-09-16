class raspberrypi_baseline::profiles::samba {
	

  package { ['samba', 'samba-common-bin'] :
    ensure => latest,
  }

  file { '/etc/samba/smb.conf' :
    ensure  => file,
    content => template('raspberrypi_baseline/samba/smb.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}