#!/bin/bash

set -e

echo "🔄 Updating Git repository and triggering Argo CD sync..."

# Add all changes
git add .

# Commit changes
git commit -m "Fix YAML formatting and kustomization issues"

# Push to main branch
git push origin main

echo "✅ Changes pushed to Git repository"
echo "⏳ Argo CD will automatically sync in a few moments..."
echo ""
echo "🔍 Check Argo CD status:"
echo "   kubectl get applications -n argocd"
echo ""
echo "🌐 Access Argo CD UI:"
echo "   kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo "   Then open: https://localhost:8080"
echo ""
echo "📧 Access Mailhog (after sync completes):"
echo "   kubectl port-forward svc/mailhog -n mailhog 8025:8025"
echo "   Then open: http://localhost:8025" 