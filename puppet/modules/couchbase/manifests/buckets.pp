class couchbase::buckets {
  Exec {
    unless => "/opt/couchbase/bin/membase bucket-list -clocalhost -uadmin -plocalhost | egrep '^default'",
  }

  exec { "initialize node":
    command => "/opt/couchbase/bin/membase node-init -c localhost",
  }

  exec { "initialize cluster":
    command => "/opt/couchbase/bin/membase cluster-init --cluster-init-username=admin --cluster-init-password=localhost --cluster-init-ramsize=256 -c localhost",
    require => Exec["initialize node"],
  }

  exec { "initialize default bucket":
    command => "/opt/couchbase/bin/membase bucket-create --bucket=default --bucket-password= --bucket-type=membase --bucket-ramsize=256 --bucket-replica=1 -clocalhost -uadmin -plocalhost",
    require => Exec["initialize cluster"],
  }
}
