#
# concate configuration file from fragements.
#

# used by other modules to register themselves in the motd
define vertx::config($content="", $order=10, $confdir = $::vertx::params::confdir) {
   if $content == "" {
      $body = $name
   } else {
      $body = $content
   }

   concat::fragment{"appconf_fragment_$name":
      target  => "$confdir/application.json",
      content => ",\n\n  \"$name\": $body",
      order   => $order
   }
}