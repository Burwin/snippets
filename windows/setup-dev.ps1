# install WSL
winget install Microsoft.WSL

# install Docker
winget install Docker.DockerDesktop

#Requires -RunAsAdministrator
#Requires -Version 5.1

# -------------------------------------------------
# 1. Detect current virtualization state
# -------------------------------------------------
$hyperV = Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -ErrorAction SilentlyContinue
$whp    = Get-WindowsOptionalFeature -Online -FeatureName HypervisorPlatform   -ErrorAction SilentlyContinue

$hvEnabled = $hyperV  ? $hyperV.State  -eq 'Enabled' : $false
$whpEnabled = $whp   ? $whp.State   -eq 'Enabled' : $false

if ($hvEnabled -and $whpEnabled) {
    Write-Host "Virtualization (Hyper-V + Hypervisor Platform) is already ENABLED." -ForegroundColor Green
} else {
    # -------------------------------------------------
    # 2. Enable the required features
    # -------------------------------------------------
    $featuresToEnable = @()
    if (-not $hvEnabled) { $featuresToEnable += 'Microsoft-Hyper-V-All' }
    if (-not $whpEnabled) { $featuresToEnable += 'HypervisorPlatform' }
    
    Write-Host "Enabling feature(s): $($featuresToEnable -join ', ')" -ForegroundColor Yellow
    
    Enable-WindowsOptionalFeature -Online -FeatureName $featuresToEnable -All -NoRestart
    
    # -------------------------------------------------
    # 3. Determine if a reboot is required
    # -------------------------------------------------
    $restartNeeded = (Get-WindowsOptionalFeature -Online -FeatureName $featuresToEnable[0]).RestartRequired
    
    if ($restartNeeded) {
        Write-Host "A reboot is REQUIRED to complete virtualization enablement." -ForegroundColor Magenta
        Write-Host "The system will restart in 30 seconds. Press Ctrl+C to abort." -ForegroundColor Red
        Start-Sleep -Seconds 30
        Restart-Computer -Force
    }
    else {
        Write-Host "Virtualization enabled successfully – NO reboot needed." -ForegroundColor Green
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
