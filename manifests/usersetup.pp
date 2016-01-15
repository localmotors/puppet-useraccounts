define useraccounts::usersetup (
  $password  = undef,
  $username  = $title,
  $ensure    = 'present',
  $groups    = undef,
  $sshkey    = undef,
  $needkey   = true,
  $comment   = undef,
  $shell     = '/bin/bash',
  $expiry    = 'absent'
  ) {

  if $groups {
    validate_array($groups)
  }
  validate_bool($needkey)

  user { $username:
    ensure     => $ensure,
    name       => $username,
    home       => "/home/${username}",
    groups     => $groups,
    password   => $password,
    comment    => $comment,
    managehome => true,
    shell      => $shell,
    expiry     => $expiry,  # must be absent or a padded date in the format of YYYY-MM-DD
  }
  if $needkey == true and $sshkey == undef {
    fail('An ssh key is required by default. If you do not need a key added, set the "needkey" parameter to false')
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
