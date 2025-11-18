# Must run as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

.\install-wsl.ps1
.\install-docker.ps1
.\install-git.ps1
.\install-vscode.ps1
.\configure-terminal.ps1
.\install-chrome.ps1
.\install-dotnet.ps1

# install LazyVim on WSL
cd ~
sudo snap install nvim --classic
