#
# Mailops Team
#
# Base module to install all basic stuff
#
class base {
  # Packages
  package { 'ccze':
    ensure  => latest,
  }
  package { 'jq':
    ensure  => latest,
  }
  package { 'lnav':
    ensure  => latest,
  }
  package { 'vim-puppet':
    ensure => latest,
  }
  package { 'vim-syntastic':
    ensure => latest,
  }
  # We don't want cloud-init
  package { 'cloud-init':
    ensure  => 'purged',
  }
  bash::alias { 'j':
    content => 'python -mjson.tool| pygmentize -l json',
  }
}
