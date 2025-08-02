# Install Argo CD using Helm
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_chart_version
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  set {
    name  = "server.extraArgs"
    value = "{--insecure}"
  }

  set {
    name  = "server.ingress.enabled"
    value = "false"
  }

  set {
    name  = "server.ingress.hosts[0]"
    value = "argocd.local"
  }

  set {
    name  = "server.ingress.tls[0].secretName"
    value = "argocd-server-tls"
  }

  depends_on = [kubernetes_namespace.argocd]
} 