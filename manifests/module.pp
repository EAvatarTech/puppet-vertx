
#
# Puppet module for installing Vert.x module.
# Vert.x package should be installed before this.
#
define vertx::module(
    $version = undef,
    $homedir = $vertx::params::homedir,
    $bindir  = $vertx::params::bindir,
) {

  $modname = "${name}~${version}"
  exec { "vertx_install_mod_${name}":
    path => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
    command => "vertx install ${modname}",
    user => $vertx::params::user
  }

}