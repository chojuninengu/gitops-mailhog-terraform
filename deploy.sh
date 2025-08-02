#!/bin/bash

set -e

echo "🚀 Starting GitOps Workshop Deployment..."

# Check if kubectl is available
if ! command -v kubectl &> /dev/null; then
    echo "❌ kubectl is not installed. Please install kubectl first."
    exit 1
fi

# Check if terraform is available
if ! command -v terraform &> /dev/null; then
    echo "❌ terraform is not installed. Please install terraform first."
    exit 1
fi

# Check if argocd CLI is available
if ! command -v argocd &> /dev/null; then
    echo "❌ argocd CLI is not installed. Please install argocd CLI first."
    exit 1
fi

echo "✅ All required tools are available"

# Deploy Argo CD with Terraform
echo "📦 Deploying Argo CD with Terraform..."
cd terraform
terraform init
terraform apply -auto-approve
cd ..

echo "⏳ Waiting for Argo CD to be ready..."
kubectl wait --for=condition=ready pod -l app.kubernetes.io/name=argocd-server -n argocd --timeout=300s

# Get Argo CD admin password
echo "🔑 Getting Argo CD admin password..."
ARGOCD_PASSWORD=$(kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode)
echo "Argo CD Admin Password: $ARGOCD_PASSWORD"

# Apply Argo CD applications
echo "📋 Applying Argo CD applications..."
kubectl apply -f argocd-apps/mailhog-app.yaml
kubectl apply -f argocd-apps/mailhog-prod-app.yaml

echo "✅ Deployment completed successfully!"
echo ""
echo "🌐 Access URLs:"
echo "   Argo CD UI: https://localhost:8080"
echo "   Username: admin"
echo "   Password: $ARGOCD_PASSWORD"
echo ""
echo "📧 Mailhog URLs:"
echo "   Dev: http://localhost:8025"
echo "   Prod: http://localhost:8026"
echo ""
echo "🔧 Commands to access services:"
echo "   # Port forward Argo CD"
echo "   kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo ""
echo "   # Port forward Mailhog Dev"
echo "   kubectl port-forward svc/mailhog -n mailhog 8025:8025"
echo ""
echo "   # Port forward Mailhog Prod"
echo "   kubectl port-forward svc/mailhog -n mailhog-prod 8026:8025"
echo ""
echo "🧹 To cleanup:"
echo "   cd terraform && terraform destroy -auto-approve" 