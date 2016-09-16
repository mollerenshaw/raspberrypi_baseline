class raspberrypi_baseline::profiles::samba {
	

  package { ['samba', 'samba-common-bin'] :
    ensure => latest,
  }

}