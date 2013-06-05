class couchbase {
  include couchbase::packages
  include couchbase::services
  include couchbase::buckets

  Class["couchbase::packages"] -> Class["couchbase::services"] -> Class["couchbase::buckets"]
}
