# Must run as Administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

# install vscode
winget install Microsoft.VisualStudioCode
code --install-extension ms-vscode-remote.remote-containers
code --install-extension bierner.markdown-mermaid
code --install-extension redhat.vscode-yaml
## TODO: configure, either with prompts or command arguments
## TODO: add basic extensions
## TODO: set default shortcuts ('code .', 'open in code...') and env vars?
