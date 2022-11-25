data "civo_size" "xsmall" {
  filter {
    key = "type"
    values = ["kubernetes"]
  }

  sort {
    key = "ram"
    direction = "asc"
  }
}

resource "civo_firewall" "ssd-dev-firewall" {
  name = "ssd-dev-firewall"
  create_default_rules = false

  ingress_rule {
    label = "traefik-http"
    protocol = "tcp"
    port_range = "80"
    cidr = ["0.0.0.0/0"]
    action = "allow"
  }

  ingress_rule {
    label = "traefik-https"
    protocol = "tcp"
    port_range = "443"
    cidr = ["0.0.0.0/0"]
    action = "allow"
  }

  ingress_rule {
    label = "kube-api-endpoint"
    protocol = "tcp"
    port_range = "6443"
    cidr = ["0.0.0.0/0"]
    action = "allow"
  }

  egress_rule {
    label      = "all"
    protocol   = "tcp"
    port_range = "1-65535"
    cidr       = ["0.0.0.0/0"]
    action     = "allow"
  }
}

resource "local_file" "kubeconfig" {
  content = civo_kubernetes_cluster.ssd-dev.kubeconfig
  filename = "${path.module}/kubeconfig.civo"
}

resource "civo_kubernetes_cluster" "ssd-dev" {
  name = var.civo_cluster_name
  region = var.civo_region
  applications = var.civo_cluster_applications
  firewall_id = civo_firewall.ssd-dev-firewall.id
  
  pools {
    size = element(data.civo_size.xsmall.sizes, var.civo_cluster_node_size).name
    node_count = var.civo_cluster_nodes
  }

  depends_on = [
    civo_firewall.ssd-dev-firewall
  ]
}

resource "time_sleep" "wait_60_seconds" {
  depends_on = [civo_kubernetes_cluster.ssd-dev]
  create_duration = "60s"
}

data "civo_loadbalancer" "ssd-dev-lb" {
  depends_on = [time_sleep.wait_60_seconds]
  name = "ssd-dev-kube-system-traefik"
}