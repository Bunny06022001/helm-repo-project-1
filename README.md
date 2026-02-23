# Project-1 GitOps Repo (Helm) - ArgoCD source of truth

## Purpose
This repository is the **GitOps source of truth** watched by ArgoCD.
Jenkins updates the Helm `values.yaml` image tag, and ArgoCD deploys the change to EKS.

## What is deployed
- Kubernetes Deployment (replicas >= 2)
- Kubernetes Service (NodePort)
- Optional: Config/Secrets (as needed)
- Deployment uses image from AWS ECR

## Directory structure
- `project-1/charts/webapp/` : Helm chart for the application
- `project-1/charts/webapp/values.yaml` : image repository + tag (updated by Jenkins)

## GitOps flow
1. Jenkins pushes a commit updating the image tag in `values.yaml`
2. ArgoCD detects the change
3. ArgoCD syncs Helm chart to EKS
4. Kubernetes performs a RollingUpdate deployment

## Rollback
Revert the commit that changed `values.yaml` tag:
- ArgoCD auto-syncs back to the previous version
