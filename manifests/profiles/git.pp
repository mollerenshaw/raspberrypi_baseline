
class raspberrypi_baseline::profiles::git($version = 'latest') {

  package { 'git' :
    ensure => $version,
  }

}