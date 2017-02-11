#
# Mailops Team
#
# status probes
#

class base::status {
  status::probe { 'dovecot':
    source  => "puppet:///modules/${module_name}/probes/dovecot",
  }
  status::probe { 'fail2ban':
    source  => "puppet:///modules/${module_name}/probes/fail2ban",
  }
  status::probe { 'https-listen':
    source  => "puppet:///modules/${module_name}/probes/https-listen",
  }
  status::probe { 'mysql':
    source  => "puppet:///modules/${module_name}/probes/mysql",
  }
  status::probe { 'nginx':
    source  => "puppet:///modules/${module_name}/probes/nginx",
  }
  status::probe { 'opendkim':
    source  => "puppet:///modules/${module_name}/probes/opendkim",
  }
  status::probe { 'php-fpm':
    source  => "puppet:///modules/${module_name}/probes/php-fpm",
  }
  status::probe { 'postfix':
    source  => "puppet:///modules/${module_name}/probes/postfix",
  }
  status::probe { 'puppet':
    source  => "puppet:///modules/${module_name}/probes/puppet",
  }
  status::probe { 'puppetmaster':
    source  => "puppet:///modules/${module_name}/probes/puppetmaster",
  }
  status::probe { 'spamd':
    source  => "puppet:///modules/${module_name}/probes/spamd",
  }
  status::probe { 'disk-usage':
    source  => "puppet:///modules/${module_name}/probes/disk-usage",
  }
} 

