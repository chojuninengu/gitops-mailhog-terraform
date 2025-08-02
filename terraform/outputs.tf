output "argocd_namespace" {
  description = "Argo CD namespace"
  value       = kubernetes_namespace.argocd.metadata[0].name
}

output "argocd_server_url" {
  description = "Argo CD server URL"
  value       = "https://localhost:8080"
}

output "argocd_admin_username" {
  description = "Argo CD admin username"
  value       = "admin"
}

output "argocd_admin_password" {
  description = "Argo CD admin password"
  value       = var.argocd_admin_password
  sensitive   = true
}

output "mailhog_url" {
  description = "Mailhog web interface URL"
  value       = "http://localhost:8025"
} 