# Must run as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

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
