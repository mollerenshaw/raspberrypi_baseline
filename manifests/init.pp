#
#
#
class raspberrypi_baseline() {

  exec { "apt-update":
    command => "/usr/bin/apt-get update"
  }

  Exec["apt-update"] -> Package <| |>

  # Use this to mount the Raspberry Pi's disk over the network.
  contain '::raspberrypi_baseline::profiles::samba'

  # Editor config.
  contain '::raspberrypi_baseline::profiles::vim'

  # Deployment/config control tools.
  #contain '::raspberrypi_baseline::profiles::puppet'
  #contain '::raspberrypi_baseline::profiles::docker'

  # Some source control tools.
  contain '::raspberrypi_baseline::profiles::git'
  contain '::raspberrypi_baseline::profiles::mercurial'
}