# GitOps MailHog Terraform

This repository contains Terraform configurations and Kubernetes manifests for deploying MailHog (a mail testing tool) using GitOps principles with ArgoCD.

## Project Structure

```
├── README.md
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── argocd.tf
├── manifests/
│   ├── base/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   └── kustomization.yaml
│   └── overlays/
│       ├── dev/kustomization.yaml
│       └── prod/kustomization.yaml
└── argocd-apps/
    └── mailhog-app.yaml
```

## Components

### Terraform
- **main.tf**: Main Terraform configuration for infrastructure
- **variables.tf**: Input variables definition
- **outputs.tf**: Output values
- **providers.tf**: Provider configurations
- **argocd.tf**: ArgoCD-specific configurations

### Kubernetes Manifests
- **base/**: Base Kubernetes manifests for MailHog
- **overlays/**: Environment-specific configurations (dev/prod)

### ArgoCD Applications
- **mailhog-app.yaml**: ArgoCD application definition

## Prerequisites

- Terraform >= 1.0
- kubectl
- ArgoCD CLI
- Access to a Kubernetes cluster

## Usage

1. Initialize Terraform:
   ```bash
   cd terraform
   terraform init
   ```

2. Plan and apply:
   ```bash
   terraform plan
   terraform apply
   ```

3. Deploy to Kubernetes:
   ```bash
   kubectl apply -f manifests/base/
   ```

4. Deploy ArgoCD application:
   ```bash
   kubectl apply -f argocd-apps/
   ```

## MailHog Access

Once deployed, MailHog will be available at:
- Web UI: `http://localhost:8025`
- SMTP: `localhost:1025`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT