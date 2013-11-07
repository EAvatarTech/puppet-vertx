#
# parameters.
#

class vertx::params {
    $version            = '2.0.1.final'
    $homedir            = '/opt/vertx'
    $bindir             = '/opt/vertx/bin'
    $confdir            = '/opt/vertx/conf'
    $vardir             = '/opt/vertx/var'
    $logdir             = '/opt/vertx/var/logs'
    $datadir            = '/opt/vertx/var/data'
    $user               = 'vertx'
    $group              = 'vertx'
    $download_url       = undef
}
