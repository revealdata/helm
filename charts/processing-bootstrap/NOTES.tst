run modes:
  region: runs on new region create
    tf_module: application
    tf_local: local.processing_region_init_ver
    helm_value: bootstrap.region.enabled = true
  instance: runs on a new MSA
    tf_module: client
    tf_local: local.processing_instance_init_ver
    helm_value: bootstrap.instance.enabled = true
    