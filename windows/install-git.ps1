# Must run as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

# install git
winget install Git.Git
## TODO: configure git global (username, email, etc)
## TODO: configure git ssh, either with prompts or command arguments
