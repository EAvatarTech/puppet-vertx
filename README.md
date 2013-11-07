puppet-vertx
============

Puppet module for setting up Vert.x application server.


### Directory Structure
All relevant files are put under the home folder '/opt/vertx' in unix-like systems.

``` 
.
├── bin
├── conf
├── lib
├── mods
├── sys-mods
├── web
└── var
    ├── data
    └── logs
```
All configurations are contained in 'conf/application.json' which is composed with puppet-concat module.

### Only tested with Ubuntu 12.04 
