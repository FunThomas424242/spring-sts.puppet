# Class: springsts
#
# This module manages springsts
#
# Parameters: none
#
# Actions:
#
# Requires: see metadata.json
#
# Sample Usage:
#



class springsts () {

  include archive::prerequisites

  include springsts::params

  $libName         = $springsts::params::libName
  $targetDir       = $springsts::params::targetDir
  $tmpDir          = $springsts::params::tmpDir
  $srcURL          = $springsts::params::srcURL
  $homeDir         = $springsts::params::homeDir

  notice("tmpDir: ${tmpDir}")
  notice("srcURL: ${srcURL}")
  notice("homeDir: ${homeDir}")
  notice("libName: ${libName}")
  notice("targetDir: ${targetDir}")

  file { $targetDir:
    ensure => directory,
  }

  file { $tmpDir:
    ensure  => directory,
  }

  archive { $libName:
    ensure     => present,
    url        => $srcURL,
    extension  => 'tar.gz',
    strip_components => 1,
    src_target => $tmpDir,
    target     => $targetDir,
    checksum   => $springsts::params::checksum,
    require    => [File[$tmpDir], File[$targetDir]],
  }

#  file { 'springsts.desktop.Schreibtisch':
#    ensure  => file,
#    path    => "${homeDir}/Schreibtisch/spring-sts.desktop",
#    content => template('springsts/spring-sts.desktop.erb'),
#    require => Archive[$libName],
#  }
#  
#  file { 'springsts.desktop.local':
#    ensure  => file,
#    path    => "${homeDir}
#    /.local/share/applications/spring-sts.desktop",
#    content => template('springsts/spring-sts.desktop.erb'),
#    require => Archive[$libName],
#  }
}