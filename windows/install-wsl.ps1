# Must run as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

winget install Microsoft.WSL
wsl install Ubuntu
sudo apt install jq -y

# install gh cli
sudo apt install gh -y
# TODO: configure GH_TOKEN env var with a gh api auth token
echo "TODO: configure GH_TOKEN env var with a gh api auth token"
