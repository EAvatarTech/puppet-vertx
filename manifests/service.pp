

class vertx::service {
  service { 'vertx-server':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
