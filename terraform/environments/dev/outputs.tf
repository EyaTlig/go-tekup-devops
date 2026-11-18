output "namespace_name" {
  description = "Nom du namespace dev"
  value       = module.namespace.namespace_name
}

output "configmap_name" {
  description = "Nom de la ConfigMap dev"
  value       = module.configmap.configmap_name
}

output "application_version" {
  description = "Version de Go-TeKup"
  value       = module.configmap.application_version
}