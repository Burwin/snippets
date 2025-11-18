# Must run as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

# install chocolatey
winget install Chocolatey.Chocolatey

# install jetbrains mono nerd-fonts
choco install nerd-fonts-jetbrainsmono

# install starship to powershell
winget install Starship.Starship
"Invoke-Expression (&starship init powershell)" | Out-File -FilePath $PROFILE -Encoding UTF8 -Append

# TODO: install/confirm bash and add profile to Windows Terminal
echo "TODO: install/confirm bash and add profile to Windows Terminal"
