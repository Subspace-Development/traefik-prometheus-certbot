output "cluster_name" {
  value = civo_kubernetes_cluster.ssd-dev.name
}

output "applications" {
  value = civo_kubernetes_cluster.ssd-dev.applications
}

output "kubernetes_version" {
  value = civo_kubernetes_cluster.ssd-dev.kubernetes_version
}

output "api_endpoint" {
  value = civo_kubernetes_cluster.ssd-dev.api_endpoint
}

output "dns_entry" {
  value = civo_kubernetes_cluster.ssd-dev.dns_entry
}

output "cluster_ready_state" {
  value = civo_kubernetes_cluster.ssd-dev.ready
}

output "civo_loadbalancer_output" {
  value = data.civo_loadbalancer.ssd-dev-lb.public_ip
}