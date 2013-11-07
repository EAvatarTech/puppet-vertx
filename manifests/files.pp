#
# copy files in 'bin' and 'conf' folders.
#

class vertx::files(
    $homedir = $vertx::params::homedir,
    $bindir = $vertx::params::bindir,
    $confdir = $vertx::params::confdir,
    $vertx_user = $vertx::params::user,
) {

    file { "${bindir}/vertx":
        content => template('vertx/vertx.erb'),
        owner => $vertx::params::user,
        group => $vertx::params::group,
        mode => 0755,
    }
    
    file { "/usr/bin/vertx":
        ensure => 'link',
        target => "$bindir/vertx",
    }

    file { "$bindir/vertx-server":
        content => template('vertx/vertx-server.erb'),
        owner => $vertx::params::user,
        group => $vertx::params::group,
        mode => 0755,
    }

    file { "/etc/init.d/vertx-server":
        ensure => 'link',
        target => "$bindir/vertx-server",
    }
    

    file { "${confdir}/langs.properties":
        content => template('vertx/langs.properties.erb'),
        owner => $vertx::params::user,
        group => $vertx::params::group,
        mode => 0644,
    }

    file { "${confdir}/logging.properties":
        content => template('vertx/logging.properties.erb'),
        owner => $vertx::params::user,
        group => $vertx::params::group,
        mode => 0644,
    }
    
    file { "${confdir}/repos.txt":
        content => template('vertx/repos.txt.erb'),
        owner => $vertx::params::user,
        group => $vertx::params::group,
        mode => 0644,
    }
    
}
