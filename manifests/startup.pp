#
# Startup script for Vert.x server.
#

class vertx::startup(
  $homedir = $::vertx::params::homedir,
  $startup_modules = {}
) {
  
  file { "${confdir}/startup.groovy":
    content => template('vertx/startup.groovy.erb'),
    owner => $vertx::params::user,
    group => $vertx::params::group,
    mode => 0644,
    notify => Service['vertx-server']
  }

  create_resources("vertx::module", $startup_modules)
  
   $appconf = "${confdir}/application.json"

   concat{$appconf:
     owner => $vertx::params::user,
     group => $vertx::params::group,
     mode => 0644,
     notify => Service['vertx-server']
   }
   
  concat::fragment{"$appconf-head":
    target => $appconf,
    content => "{\n  \"vertx.version\": \"${version}\"",
    order => 01,
  }

  concat::fragment{"$appconf-tail":
    target => $appconf,
    content => "\n}\n",
    order => 90,
  }    
  
#  file { "${confdir}/application.json":
#    content => template('vertx/application.json.erb'),
#    owner => $vertx::params::user,
#    group => $vertx::params::group,
#    mode => 0644,
#    notify => Service['vertx-server']
#  }
  
}