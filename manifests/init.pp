#
# Mailops Team
#
# Base module to install all basic stuff
#
class base {
  package { 'fail2ban':
    ensure => latest,
  }
}
