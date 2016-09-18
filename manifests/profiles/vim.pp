
class raspberrypi_baseline::profiles::vim($version = 'latest') {

  package { 'vim' :
    ensure => latest,
  }
}