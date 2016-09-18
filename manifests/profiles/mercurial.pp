

class raspberrypi_baseline::profiles::mercurial($version = 'latest') {

  package { 'mercurial':
    ensure => $version,
  }

}