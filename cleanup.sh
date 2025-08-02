#!/bin/bash

set -e

echo "🧹 Starting cleanup process..."

# Delete Argo CD applications
echo "🗑️  Deleting Argo CD applications..."
kubectl delete -f argocd-apps/mailhog-app.yaml --ignore-not-found=true
kubectl delete -f argocd-apps/mailhog-prod-app.yaml --ignore-not-found=true

# Delete mailhog namespaces
echo "🗑️  Deleting mailhog namespaces..."
kubectl delete namespace mailhog --ignore-not-found=true
kubectl delete namespace mailhog-prod --ignore-not-found=true

# Destroy Terraform resources
echo "🗑️  Destroying Terraform resources..."
cd terraform
terraform destroy -auto-approve
cd ..

echo "✅ Cleanup completed successfully!" 