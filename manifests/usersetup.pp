define useraccounts::usersetup (
  $password,
  $username  = $title,
  $ensure    = 'present',
  $groups    = undef,
  $sshkey    = undef,
  $needkey   = true,
  $comment   = undef,
  $shell     = '/bin/bash'
  ) {
  user { $username:
    ensure     => $ensure,
    name       => $username,
    home       => "/home/${username}",
    groups     => $groups,
    password   => $password,
    comment    => $comment,
    managehome => true,
    shell      => $shell,
  }
  if $needkey == true {
    ssh_authorized_key { $username:
      ensure  => $ensure,
      key     => $sshkey,
      type    => 'ssh-rsa',
      user    => $username,
      require => User[$username],
    }
  }
}
