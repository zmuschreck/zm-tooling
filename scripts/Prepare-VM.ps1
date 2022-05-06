function Install-Minikube {
    
    if (!(Test-Path -Path "c:\minikube")) {
        New-Item -Path 'c:\' -Name 'minikube' -ItemType Directory -Force
    }
    
    Invoke-WebRequest -OutFile 'c:\minikube\minikube.exe' -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' -UseBasicParsing

    New-Item $PsHome\profile.ps1
    
    Set-Alias -Name minikube -Value C:\minikube\minikube.exe
    
}

function Install-Hv {

    # Hyper-V aktivieren
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

}

$Packages = 'az.powershell',
            'azure-cli',
            'docker-desktop',
            'git',
            'GoogleChrome-AllUsers',
            'gsudo',
            'kubernetes-cli',
            'kubernetes-helm',
            'lens',
            'oh-my-posh',
            'packer',
            'poshgit',
            'powershell-core',
            'terraform',
            'vscode'
            
        If(Test-Path -Path "$env:ProgramData\Chocolatey") {
        # Pakete aus $Packages installieren
        ForEach ($PackageName in $Packages)
            {
                choco install $PackageName -y
            }
        }
        Else {
        # Chocolatey installieren
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))      

        # Pakete aus $Packages installieren
        ForEach ($PackageName in $Packages)
            {
                choco install $PackageName -y
            }
        }
        
       Add-PoshGitToProfile
       
