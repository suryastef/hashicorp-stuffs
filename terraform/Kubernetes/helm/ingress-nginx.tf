resource "helm_release" "ingress-nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "devops-ingress-nginx"
  create_namespace = true
}

data "kubernetes_service" "ingress-nginx" {
  metadata {
    name      = "ingress-nginx-controller"
    namespace = helm_release.ingress-nginx.namespace
  }
  depends_on = [
    helm_release.ingress-nginx
  ]
}

locals {
  ingress_nginx_external_ip = data.kubernetes_service.ingress-nginx.status.0.load_balancer.0.ingress.0.ip
}

output "ingress_nginx_external_ip" {
  description = "The NGINX Ingress Controller external IP"
  value       = local.ingress_nginx_external_ip
}
