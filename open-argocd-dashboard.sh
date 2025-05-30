#!/bin/bash

NAMESPACE="argocd"
PORT=8080
ARGOCD_SERVICE="argocd-server"
USERNAME="admin"

# Step 1: Port-forward Argo CD server
echo "🚀 Starting port-forward on http://localhost:$PORT ..."
kubectl port-forward svc/$ARGOCD_SERVICE -n $NAMESPACE $PORT:443 >/dev/null 2>&1 &
PORT_FORWARD_PID=$!
sleep 3

# Step 2: Fetch initial admin password
echo "🔐 Retrieving ArgoCD initial admin password..."
PASSWORD=$(kubectl -n $NAMESPACE get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d)

# Step 3: Login to Argo CD
echo "🔑 Logging into ArgoCD CLI..."
argocd login localhost:$PORT --username $USERNAME --password $PASSWORD --insecure

# Step 4: Open the dashboard in default browser
echo "🌐 Opening ArgoCD dashboard in browser..."
xdg-open http://localhost:$PORT || open http://localhost:$PORT

# Optional: Cleanup on script exit
cleanup() {
    echo "🧹 Stopping port-forward..."
    kill $PORT_FORWARD_PID
}
trap cleanup EXIT
wait $PORT_FORWARD_PID
