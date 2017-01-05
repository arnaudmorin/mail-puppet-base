#
# Mailops Team
#
# Some configuration overrides for fail2ban
#

class base::fail2ban {
  file { '/etc/fail2ban/paths-overrides.local':
    source  => "puppet:///modules/${module_name}/fail2ban/paths-overrides.local",
    require => Package['fail2ban'],
  }
}
