# ArgoCD Setup and GitOps Deployment Guide

This guide explains how to **install ArgoCD**, connect a **Git repository**, and deploy applications to a **Kubernetes cluster** using **GitOps**.  

# what is Argocd

ArgoCD is a declarative GitOps continuous delivery tool for Kubernetes. It helps you automatically deploy and manage applications in your Kubernetes cluster using Git as the single source of truth

---

## **Prerequisites**

- Kubernetes cluster (Minikube / Kind / EKS / GKE / AKS)
- kubectl installed and configured
- Git repository containing Kubernetes manifests or Helm charts
- Optional: ArgoCD CLI installed on local machine

---

## **1. Install ArgoCD**

### **Step 1: Create Namespace**
```bash
kubectl create namespace argocd
```
### Step 2: Install ArgoCD

```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### Step 3: Access ArgoCD Server

By default, ArgoCD uses a **ClusterIP** service, so we need to use port forwarding to access the UI:

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

After running the above command, open your browser and visit:

https://localhost:8080

### Step 4: Get Initial Admin Password

ArgoCD generates an initial admin password automatically. To retrieve it, run:

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

