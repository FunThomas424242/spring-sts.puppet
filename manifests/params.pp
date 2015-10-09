# Class: springsts::params
#
# This class defines some parameters
#
class springsts::params (
  $user = $::id,
  $springstsVersion = '3.7.1',
  $tmpDir = '/tmp',
  $homeDir = "/home/${::id}",
  $targetDir = "/home/${::id}/installationen",
  $checksum = false,
)
{
  
  $srcURL = undef ?{
    default => "http://dist.springsource.com/release/STS/${springstsVersion}.RELEASE/dist/e4.5/spring-tool-suite-${springstsVersion}.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz"
  }
  
  
  $libName = undef ? {
    default => "sts-${springstsVersion}.RELEASE"
  }

}