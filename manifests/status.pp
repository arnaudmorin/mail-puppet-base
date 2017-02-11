#
# Mailops Team
#
# status probes
#

class base::status {
  status::probe { 'https-listen':
    source  => "puppet:///module/${module_name}/probes/https-listen",
  }
} 

