6) Write helm chart/k8s manifests to deploy a microservice
- If possible demonstrate using minikube/kind cluster on your local laptop

I decided to use Helm chart because is more quick than k8s manifest

Requirements:

    1. Install chocolatey to install helm program with next command: (Admin Powershell windows)
        More details here: https://chocolatey.org/install
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

    2- Install kubernetes windows 
        With chocolatey command: choco install kubernetes-cli (Admin privileges)
        Installed kubectl to use computer
    2- Install helm in windows (Administrator permission terminal needed)
        Command: choco install kubernetes-helm
        Command installed: helm
    
Steps:
    1- Command install default chart Helm: 
        helm install


