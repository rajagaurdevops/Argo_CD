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
argocd app list      :>  List all applications managed by ArgoCD:

argocd app sync <app-name>   :>  Sync an application to match the Git repository:

argocd app get <app-name>     :>  Get the current status of an application:

argocd app delete <app-name>   :> Delete an application:

argocd app wait <app-name> --health   :> Wait for the application to become healthy:

argocd app set <app-name> --<parameter-name> <value>    :>  Set application parameters (e.g., update image, set resource limits):

3. Managing Repositories
argocd repo add <repo-url> --username <username> --password <password> --name <repo-name>  :>  Add a Git or Helm repository to ArgoCD:

argocd repo list    :> List all repositories added to ArgoCD

argocd repo remove <repo-name>   :>  Remove a repository from ArgoCD

4. Managing Clusters
argocd cluster add <cluster-name>   :>  Add a Kubernetes cluster to ArgoCD:

argocd cluster list   :>  List all Kubernetes clusters connected to ArgoCD:

argocd cluster remove <cluster-name>   :>  Remove a Kubernetes cluster from ArgoCD:

5. Authentication
argocd login <argocd-server> --username <username> --password <password>   :>  Log into the ArgoCD server:

argocd account list  :> List the details of your currently logged-in ArgoCD account:

argocd logout <argocd-server>   :>  Log out from the ArgoCD server:

6. Managing Projects
argocd proj create <project-name> --description <description> --dest-namespace <namespace>   :>  Create a project in ArgoCD (used to group applications under a project):

argocd proj list   :>  List all projects created in ArgoCD:

argocd proj delete <project-name>   :>  Delete a project from ArgoCD:

7. Application Health & Sync Status
argocd app health <app-name>   :>  Show the health status of an application (e.g., Healthy, Degraded, Missing, etc.)

argocd app sync-status <app-name>    :>  Show whether the application is in sync with the Git repository:

8. Version and Help
argocd version    :>  Display the version of ArgoCD CLI and server:

argocd <command> --help   :>  Get detailed help for any specific ArgoCD command:

9. Kubeconfig and Dashboard
argocd cluster kubeconfig <cluster-name>    :>  Export the kubeconfig file for a given cluster:

Open the ArgoCD web UI in your browser via port forwarding:
argocd admin dashboard