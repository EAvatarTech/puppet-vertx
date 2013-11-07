#
# Startup script for Vert.x server.
#

class vertx::startup(
  $homedir = $::vertx::params::homedir,
  $startup_modules = []
) {

  file { "${confdir}/startup.groovy":
    content => template('vertx/startup.groovy.erb'),
    owner => $vertx::params::user,
    group => $vertx::params::group,
    mode => 0644,
    notify => Service['vertx-server']
  }

}