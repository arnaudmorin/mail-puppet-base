#
# Mailops Team
#
# Some configuration for nginx
#

class base::nginx {
  # Packages
  package { 'nginx':
    ensure  => latest
  }

  # Main files
  file { '/var/www/':
    ensure  => directory,
    owner   => 'www-data',
    group   => 'www-data',
  }

  file { '/etc/nginx/sites-enabled/default':
    ensure  => absent,
    notify  => Service['nginx'],
  }

  service { 'nginx':
    ensure  => running,
  }
}
