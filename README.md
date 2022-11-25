# traefik-prometheus-certbot
Terraform to spin up and deploy traefik, prometheus/grafana/loki stack and certbot to a civo kubernetes cluster

## Usage
Install Terraform and Helm 3

clone the repository

enter the repository's local directory

rename `env.tfvars.example` to `env.tfvars`

update `env.tfvars` with your civo api key and preferences.

```bash
$ terraform init

$ terraform plan -out civo.plan -var-file="env.tfvars"

$ terraform apply civo.plan
```

When the plan is done applying, you will have a new kubernetes cluster with a Traefik v2 LoadBalancer, grafana/prometheus/loki deployment.

Add the subspacedev helm repository to install ingress configurations and such

`helm repo add subspacedev https://subspace-development.github.io/helm-repository/`

`helm search repo subspacedev`

`helm install subspacedev/setup-traefik`

`etc...`
