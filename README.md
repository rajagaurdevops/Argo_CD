What is ArgoCD?

ArgoCD (Argo Continuous Delivery) is a GitOps-based continuous delivery tool for Kubernetes. It allows you to automate the deployment of applications to Kubernetes clusters by using Git repositories as the source of truth for your application configuration and Kubernetes manifests.

ArgoCD provides a declarative approach to manage the entire deployment pipeline by syncing the state of your Kubernetes cluster with the state defined in Git repositories. Essentially, ArgoCD ensures that the application in your cluster matches the configuration described in the Git repository

Why Use ArgoCD?
ArgoCD brings several benefits for managing deployments and automating continuous delivery on Kubernetes:




# Create an Application
argocd app create <app-name> \
  --repo <repository-url> \
  --path <path-to-application> \
  --dest-server <destination-server> \
  --dest-namespace <namespace>

2. Managing Applications

    List all applications managed by ArgoCD:
argocd app list

Sync an application to match the Git repository:
argocd app sync <app-name>

Get the current status of an application:
argocd app get <app-name>

Delete an application:
argocd app delete <app-name>

Wait for the application to become healthy:
argocd app wait <app-name> --health

Set application parameters (e.g., update image, set resource limits):
    argocd app set <app-name> --<parameter-name> <value>

3. Managing Repositories
    Add a Git or Helm repository to ArgoCD:
argocd repo add <repo-url> --username <username> --password <password> --name <repo-name>

List all repositories added to ArgoCD:
argocd repo list

Remove a repository from ArgoCD:
    argocd repo remove <repo-name>

4. Managing Clusters
    Add a Kubernetes cluster to ArgoCD:
argocd cluster add <cluster-name>

List all Kubernetes clusters connected to ArgoCD:
argocd cluster list

Remove a Kubernetes cluster from ArgoCD:
    argocd cluster remove <cluster-name>

5. Authentication
    Log into the ArgoCD server:
argocd login <argocd-server> --username <username> --password <password>

List the details of your currently logged-in ArgoCD account:
argocd account list

Log out from the ArgoCD server:
    argocd logout <argocd-server>

6. Managing Projects
    Create a project in ArgoCD (used to group applications under a project):
argocd proj create <project-name> --description <description> --dest-namespace <namespace>

List all projects created in ArgoCD:
argocd proj list

Delete a project from ArgoCD:
    argocd proj delete <project-name>

7. Application Health & Sync Status
    Show the health status of an application (e.g., Healthy, Degraded, Missing, etc.):
argocd app health <app-name>

Show whether the application is in sync with the Git repository:
    argocd app sync-status <app-name>

8. Version and Help
    Display the version of ArgoCD CLI and server:
argocd version

Get detailed help for any specific ArgoCD command:
    argocd <command> --help

9. Kubeconfig and Dashboard
    Export the kubeconfig file for a given cluster:
argocd cluster kubeconfig <cluster-name>

Open the ArgoCD web UI in your browser via port forwarding:
argocd admin dashboard