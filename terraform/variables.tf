variable "argocd_namespace" {
  type        = string
  description = "The namespace to install Argo CD in"
  default     = "argocd"
}
