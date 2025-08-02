variable "argocd_namespace" {
  description = "Namespace for Argo CD"
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "Argo CD Helm chart version"
  type        = string
  default     = "5.51.6"
}

variable "argocd_admin_password" {
  description = "Argo CD admin password"
  type        = string
  default     = "admin123"
  sensitive   = true
} 