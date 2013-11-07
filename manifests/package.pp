#
# install base vert.x package.
#

class vertx::package(
    $version        = $vertx::params::version,
    $homedir        = $vertx::params::homedir,
    $bindir         = $vertx::params::bindir,
    $download_url   = $vertx::params::download_url
)  {

    $libname = "vert.x-${version}"
    if !$download_url {
        $url = "http://dl.bintray.com/vertx/downloads/${libname}.tar.gz"
    } else {
        $url = $download_url
    }
    
    $instdir = "${homedir}/${libname}"
    $buildpkgs = ["wget", "tar"]

    user {"vertx":
        ensure => present,
        gid    => "vertx",
        managehome => true,
    }

    group {"vertx":
        ensure => present,
    }

    # Builds basic directory structure and purges old files.
    file { [$homedir, "$homedir/bin" , "$homedir/conf", 
             "$homedir/mods", "$homedir/sys-mods"]:
        ensure  => directory,
        owner => 'vertx',
        group => 'vertx',
        purge => true,
    } ->

    # Ensures the 'var' and its subfolders and keeps existing data files and logs.
    file { ["$homedir/var", "$homedir/var/logs", "$homedir/var/data"]:
        ensure  => directory,
        owner => 'vertx',
        group => 'vertx',
    } ->

    package { $buildpkgs:
        ensure => present,
    }

    exec {"download_and_untar":
        provider => shell,
        command  => "wget -qO- ${url} | tar xzf - -C /tmp",
        require  => Package[$buildpkgs],
    } ->
    
    file { "$homedir/lib":
        recurse => true,
        purge   => true,
        owner => 'vertx',
        group => 'vertx',
        source  => "/tmp/${libname}/lib",
    }
    

#    file { $instdir:
#        ensure  => directory,
#        recurse => true,
#        purge   => true,
#        source  => "/tmp/${libname}",
#   } ->


}