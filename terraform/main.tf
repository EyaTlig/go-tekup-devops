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

# Module 1 : Namespace
module "namespace" {
  source = "./modules/namespace"

  namespace_name = "terraform-demo"
}

# Module 2 : ConfigMap
module "configmap" {
  source = "./modules/configmap"

  configmap_name  = "go-tekup-config"
  namespace_name  = module.namespace.namespace_name
  app_name        = var.app_name
  app_environment = var.app_environment
  app_version     = var.app_version
  app_description = "Application de demonstration Kubernetes"
}

# Migration des ressources existantes vers les modules
moved {
  from = kubernetes_namespace.terraform_demo
  to   = module.namespace.kubernetes_namespace.this
}

moved {
  from = kubernetes_config_map.app_config
  to   = module.configmap.kubernetes_config_map.this
}