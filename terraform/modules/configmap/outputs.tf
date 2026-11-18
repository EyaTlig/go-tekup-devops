output "configmap_name" {
  description = "Nom de la ConfigMap"
  value       = kubernetes_config_map.this.metadata[0].name
}

output "application_version" {
  description = "Version de l'application"
  value       = kubernetes_config_map.this.data["APP_VERSION"]
}