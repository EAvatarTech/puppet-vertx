#
#
#

class vertx(
    $version        = $vertx::params::version,
    $homedir        = $vertx::params::homedir,
    $bindir         = $vertx::params::bindir,
    $download_url   = $vertx::params::download_url,
    $boot_modules    = []
) inherits vertx::params {

    class {'vertx::package':
        version => $version,
        homedir => $homedir,
        bindir => $bindir,
        download_url => $download_url,
    } ->
    
    class {'vertx::files':
        homedir => $homedir,
        bindir => $bindir,   
    } ->
    
    class {'vertx::startup':
        homedir => $homedir,
        boot_modules => $boot_modules 
    } ->
    
    vertx::module { 'io.vertx~lang-groovy':
        version => '2.0.0-final'
    } ->
    
    class {'vertx::service':
    }
    
}