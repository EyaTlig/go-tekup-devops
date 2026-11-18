variable "configmap_name" {
  description = "Nom de la ConfigMap"
  type        = string
}

variable "namespace_name" {
  description = "Namespace de la ConfigMap"
  type        = string
}

variable "app_name" {
  type = string
}

variable "app_environment" {
  type = string
}

variable "app_version" {
  type = string
}

variable "app_description" {
  type = string
}