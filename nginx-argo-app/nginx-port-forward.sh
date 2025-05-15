#!/bin/bash

# 🏷️ Argo CD application और Kubernetes service का नाम
APP_NAME="nginx-demo"
SERVICE_NAME="nginx-service"
NAMESPACE="default"

# Argo CD app को sync करो (Git से cluster तक changes apply होंगे)
echo "Syncing ArgoCD app: $APP_NAME ..."
argocd app sync $APP_NAME

# 8080 से शुरू करके कोई free local port ढूंढो (जो पहले से इस्तेमाल में ना हो)
echo " Searching for an available port..."
START_PORT=8080
END_PORT=9000
PORT_FOUND=0

# 8080 से 9000 तक loop चलाकर पहला free port ढूंढना
for ((port=$START_PORT; port<=$END_PORT; port++)); do
    if ! lsof -i :$port >/dev/null 2>&1; then
        PORT_FOUND=$port
        break
    fi
done

# अगर कोई भी port available नहीं मिला
if [ $PORT_FOUND -eq 0 ]; then
    echo "No free port found between $START_PORT and $END_PORT"
    exit 1
fi

# Kubernetes की service को उस free port पर forward करो
echo " Forwarding service '$SERVICE_NAME' to http://localhost:$PORT_FOUND"
kubectl port-forward svc/$SERVICE_NAME $PORT_FOUND:80 -n $NAMESPACE

kubectl port-forward svc/argocd-server -n argocd 8080:443  :>  port forwarding
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
