#
# Mailops Team
#
# Install some tools
#

class base::tools (
  $plik_token = 'undefined',
  $plik_url   = 'https://plik.root.gg',
){
  File {
    ensure  => file,
    owner   => 'root',
    group   => 'root',
  }

  file { '/usr/local/bin/plik':
    source  => "puppet:///modules/${module_name}/plik",
  }

  file { '/root/.plikrc':
    content => template("${module_name}/plikrc"),
  }

  file { '/usr/local/bin/secure-upload':
    source  => "puppet:///modules/${module_name}/secure-upload",
  }
}
