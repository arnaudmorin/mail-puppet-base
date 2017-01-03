#
# Mailops Team
#
# MOTD Message of the day
#

class base::motd {
  file { '/etc/update-motd.d':
    ensure  => directory,
    recurse => true,
    force   => true,
    purge   => true,
    source  => "puppet:///modules/motd/${module_name}/",
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  }

  # There is currently bug in the way motd is handled on pam_motd
  # So let's create a cronjob to update the motd correctly
  cron { 'update-motd':
    command => '/bin/run-parts --lsbsysinit /etc/update-motd.d 2>/dev/null > /run/motd.dynamic',
    user    => 'root',
    minute  => '*',
  }

  # We need toilet
  package { 'toilet':
    ensure  => latest,
  }
}
