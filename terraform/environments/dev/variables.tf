variable "namespace_name" {
  description = "Nom du namespace de développement"
  type        = string
  default     = "terraform-demo-dev"
}

variable "app_version" {
  description = "Version de Go-TeKup"
  type        = string
  default     = "1.0"
}