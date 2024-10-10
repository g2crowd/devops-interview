output "nginx_loadbalancer_url" {
  value = kubernetes_service.nginx.status[0].load_balancer[0].ingress[0].hostname
  description = "The URL of the Nginx load balancer"
}