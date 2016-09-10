
class raspberrypi_baseline::profiles::docker($version = 'latest') {

  package { 'docker' :
    ensure => $version,
  }

}