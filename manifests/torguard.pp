# Setting up Torguard
class vpnize::torguard ($src = '/vagrant/TorGuardPRO.zip') {

  archive::extract {'torguard configuration':
    src_target => $src
  }

  package{'openvpn':
    ensure  => present
  }
}
