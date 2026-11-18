output "namespace_name" {
  description = "Nom du namespace Kubernetes"
  value       = module.namespace.namespace_name
}

output "configmap_name" {
  description = "Nom de la ConfigMap"
  value       = module.configmap.configmap_name
}

output "application_version" {
  description = "Version de l'application"
  value       = module.configmap.application_version
}