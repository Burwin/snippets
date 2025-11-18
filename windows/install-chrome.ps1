# Must run as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

# install chrome
winget install Google.Chrome
## TODO: install 1password extension?
## TODO: configure 1password?
## TODO: import template profile (bookmarks / settings)?
