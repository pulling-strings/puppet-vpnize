# Setting up juniper openconnect
class vpnize::openconnect {
  
  apt::ppa {'ppa:intel352/openconnect':
  }

  Class['apt::update'] ->

  package{'openconnect':
    ensure  => present,
    require => Apt::PPa['ppa:intel352/openconnect']
  }
}
