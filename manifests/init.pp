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


  notice("srcURL: ${springsts::params::srcURL}")
  notice("homeDir: ${springsts::params::homeDir}")
  notice("libName: ${springsts::params::libName}")
  notice("targetDir: ${springsts::params::targetDir}")

  file { $springsts::params::targetDir:
    ensure => directory,
  }

  file { $springsts::params::tmpDir:
    ensure  => directory,
  }

  archive { $springsts::params::libName:
    ensure     => present,
    url        => $springsts::params::srcURL,
    extension  => 'tar.gz',
    src_target => $springsts::params::tmpDir,
    target     => $springsts::params::targetDir,
    checksum   => $springsts::params::checksum,
    require    => [File[$springsts::params::tmpDir]
      , File[$springsts::params::targetDir]
    ],
  }

  file { 'springsts.desktop.Schreibtisch':
    ensure  => file,
    path    => "${springsts::params::homeDir}/Schreibtisch/spring-sts.desktop",
    content => template('springsts/spring-sts.desktop.erb'),
    require => Archive[$springsts::params::libName],
  }
  
  file { 'springsts.desktop.local':
    ensure  => file,
    path    => "${springsts::params::homeDir}
    /.local/share/applications/spring-sts.desktop",
    content => template('springsts/spring-sts.desktop.erb'),
    require => Archive[$springsts::params::libName],
  }
}