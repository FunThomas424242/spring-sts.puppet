# Class: springsts::params
#
# This class defines some parameters
#
class springsts::params (
  $user = "${::id}",
  $springstsVersion = '3.7.1',
  $tmpDir = '/tmp',
  $homeDir = "/home/${::id}",
  $targetDir = "/home/${::id}/installationen",
  $checksum = false,
  $srcURL = 'http://dist.springsource.com/release/STS/3.7.1.RELEASE/dist/e4.5/spring-tool-suite-3.7.1.RELEASE-e4.5.1-linux-gtk-x86_64.tar.gz',
  $libName = 'spring-tool-suite-3.7.1.RELEASE-e4.5.1-linux-gtk-x86_64',
)
{

}