
class raspberrypi_baseline() {

  contain '::raspberrypi_baseline::profiles::samba'
  contain '::raspberrypi_baseline::profiles::vim'
  #contain '::raspberrypi_baseline::profiles::docker'
  contain '::raspberrypi_baseline::profiles::puppet'

  # Some source control tools.
  contain '::raspberrypi_baseline::profiles::git'
  contain '::raspberrypi_baseline::profiles::mercurial'
}