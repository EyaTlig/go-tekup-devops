terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path = "C:/Users/Eya/.kube/config"
}
module "namespace" {
  source = "../../modules/namespace"

  namespace_name = var.namespace_name
}

module "configmap" {
  source = "../../modules/configmap"

  configmap_name   = "go-tekup-config"
  namespace_name  = module.namespace.namespace_name
  app_name        = "Go-TeKup"
  app_environment = "development"
  app_version     = var.app_version
  app_description = "Go-TeKup development environment"
}