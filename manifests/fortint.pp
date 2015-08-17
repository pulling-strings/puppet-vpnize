# Setting up fortin client
class vpnize::fortint {

  pullib::debinstall {'forticlient':
    url          => 'https://hadler.me/files',
    deb          => 'forticlient-sslvpn_4.4.2317-1_amd64.deb',
    dependencies => ['lib32gcc1','libc6-i386']
  }
}
