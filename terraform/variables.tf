variable "app_name" {
  description = "Nom de l'application"
  type        = string
  default     = "Go-TeKup"
}

variable "app_environment" {
  description = "Environnement de l'application"
  type        = string
  default     = "development"
}

variable "app_version" {
  description = "Version de l'application"
  type        = string
  default     = "2.0"
}