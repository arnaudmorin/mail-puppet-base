#
# Mailops Team
#
# status probes
#

class base::status {
  status::probe { 'https-listen':
    source  => "puppet:///modules/${module_name}/probes/https-listen",
  }
} 

