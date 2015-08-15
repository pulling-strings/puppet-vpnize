# Setting up Torguard
class vpnize::torguard (
  $src = '/vagrant',
  $archive = 'TorGuardPRO',
  $username = 'foo',
  $password = 'bar'
) {

  archive::extract {$archive:
    src_target => $src,
    target     => '/opt',
    extension  => 'zip'
  } ->

  file { "/opt/${archive}/pass.txt":
    ensure  =>  file,
    mode    =>  '0644',
    content =>  template('vpnize/torguard-pass.erb'),
    owner   =>  root,
    group   =>  root,
  }


  package{'openvpn':
    ensure  => present
  }

  file { '/usr/bin/torguard':
    ensure  => file,
    content => "cd /opt/${archive} && openvpn --config \"TorGuard.\$1.ovpn\" --auth-user-pass pass.txt",
    mode    => 'a+rx',
    owner   => root,
    group   => root,
  }

}
