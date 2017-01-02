#
# Mailops Team
#
# Base module to install all basic stuff
#
class base {
  package { 'fail2ban':
    ensure => latest,
  }
  package { 'vim-puppet':
    ensure => latest,
  }
  package { 'vim-syntastic':
    ensure => latest,
  }
}
