variable "civo_api_key" {
  type = string
  description = "Civo API key for authentication"
}

variable "civo_cluster_name" {
  type = string
  description = "Civo K8s Cluster Name"
  default = "ssd-dev"
}

variable "civo_region" {
  type = string
  description = "Civo Region for Cluster"
  default = "NYC1"
}

variable "civo_cluster_applications" {
  type = string
  description = "Civo Applications to deploy on cluster"
  default = "Traefik-v2-loadbalancer,-Traefik-v2-nodeport,cert-manager,loki-stack"
}

variable "civo_cluster_nodes" {
  type = number
  description = "Kubernetes node count"
  default = 1
}

variable "civo_cluster_node_size" {
  type = number
  description = "Node size for each node in the cluster"
  default = 0
}