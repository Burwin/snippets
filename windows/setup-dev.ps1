# Must run as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

# install WSL
winget install Microsoft.WSL

# install Docker
winget install Docker.DockerDesktop

Write-Host "Checking virtualization status..." -ForegroundColor Cyan

## Check Hyper-V feature
try {
    $hyperV = Get-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-All" -ErrorAction Stop
}
catch {
    Write-Error "Failed to query Hyper-V feature. Error: $_"
    exit 1
}

## Check Hypervisor Platform
try {
    $whp = Get-WindowsOptionalFeature -Online -FeatureName "HypervisorPlatform" -ErrorAction Stop
}
catch {
    Write-Error "Failed to query HypervisorPlatform feature. Error: $_"
    exit 1
}

$hvEnabled = $hyperV.State -eq "Enabled150"
$whpEnabled = $whp.State -eq "Enabled150"

if ($hvEnabled -and $whpEnabled) {
    Write-Host "Virtualization is already ENABLED (Hyper-V + Hypervisor Platform)." -ForegroundColor Green
} else {
    # Enable missing features
    $featuresToEnable = @()
    if (-not $hvEnabled) { $featuresToEnable += "Microsoft-Hyper-V-All" }
    if (-not $whpEnabled) { $featuresToEnable += "HypervisorPlatform" }
    
    Write-Host "Enabling: $($featuresToEnable -join ', ')" -ForegroundColor Yellow
    
    try {
        Enable-WindowsOptionalFeature -Online -FeatureName $featuresToEnable -All -NoRestart -ErrorAction Stop
        Write-Host "Features enabled successfully." -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to enable features. Error: $_"
        exit 1
    }
    
    # Check if reboot is needed
    $restartNeeded = $false
    foreach ($feature in $featuresToEnable) {
        $f = Get-WindowsOptionalFeature -Online -FeatureName $feature
        if ($f.RestartRequired) {
            $restartNeeded = $true
            break
        }
    }
    
    if ($restartNeeded) {
        Write-Host "REBOOT REQUIRED to complete virtualization setup." -ForegroundColor Magenta
        Write-Host "System will restart in 30 seconds. Press Ctrl+C to cancel." -ForegroundColor Red
        Start-Sleep -Seconds 30
        Restart-Computer -Force
    }
    else {
        Write-Host "Virtualization enabled! No reboot needed." -ForegroundColor Green
    }
}

# install git
winget install Git.Git
## TODO: configure git, either with prompts or command arguments

# install vscode
winget install Microsoft.VisualStudioCode
code --install-extension ms-vscode-remote.remote-containers
code --install-extension bierner.markdown-mermaid
code --install-extension redhat.vscode-yaml
## TODO: configure, either with prompts or command arguments
## TODO: add basic extensions
## TODO: set default shortcuts ('code .', 'open in code...') and env vars?

# install chocolatey
winget install Chocolatey.Chocolatey

# install jetbrains mono nerd-fonts
choco install nerd-fonts-jetbrainsmono

# install starship to powershell
winget install Starship.Starship
"Invoke-Expression (&starship init powershell)" | Out-File -FilePath $PROFILE -Encoding UTF8 -Append

# install chrome
winget install Google.Chrome
## TODO: install 1password extension?
## TODO: configure 1password?
## TODO: import template profile (bookmarks / settings)?

# install dotnet 9
winget install Microsoft.DotNet.SDK.9

# install visual studio
winget install Microsoft.VisualStudio.2022.Community
## TODO: configure settings for C#
## TODO: configure snippets
## TODO: install NCrunch?
## TODO: configure user profile?
