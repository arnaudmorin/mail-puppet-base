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
  file { '/var/www/html/':
    ensure    => directory,
    owner     => 'www-data',
    group     => 'www-data',
    recurse   => true,
  }

  file { "/var/www/html/.well-known":
    ensure    => directory,
    owner     => 'www-data',
    group     => 'www-data',
    require   => File['/var/www/html/'],
  }

  file { '/var/www/html/index.html':
    ensure    => file,
    content   => template("${module_name}/nginx-default-index"),
    owner     => 'www-data',
    group     => 'www-data',
    require   => File['/var/www/html/'],
  }

  file { '/etc/nginx/sites-available/default':
    ensure    => file,
    content   => template("${module_name}/nginx-default-vhost"),
    require   => Package['nginx'],
    notify    => Service['nginx'],
  }
  ->
  file { '/etc/nginx/sites-enabled/default':
    ensure    => link,
    target    => '/etc/nginx/sites-available/default',
    notify    => Service['nginx'],
  }

  letsencrypt::certonly { 'mailops':
    domains              => ['mailops.fr'],
    plugin               => 'webroot',
    webroot_paths        => ['/var/www/html'],
    manage_cron          => true,
    cron_success_command => '/bin/systemctl reload nginx.service',
  }

  service { 'nginx':
    ensure    => running,
  }
}
