# ArgoCD Setup and GitOps Deployment Guide

This guide explains how to **install ArgoCD**, connect a **Git repository**, and deploy applications to a **Kubernetes cluster** using **GitOps**.  

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
