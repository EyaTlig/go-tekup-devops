resource "kubernetes_config_map" "this" {
  metadata {
    name      = var.configmap_name
    namespace = var.namespace_name
  }

  data = {
    APP_NAME        = var.app_name
    APP_ENV         = var.app_environment
    APP_VERSION     = var.app_version
    APP_DESCRIPTION = var.app_description
  }
}