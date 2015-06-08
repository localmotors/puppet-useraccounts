define useraccounts::usersetup ($password, $username, $ensure='present', $groups=undef, $sshkey=undef, $needkey=false, $comment=undef) {
  user { $username:
    ensure     => $ensure,
    name       => $username,
    home       => "/home/${username}",
    groups     => $groups,
    password   => $password,
    comment    => $comment,
    managehome => true,
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