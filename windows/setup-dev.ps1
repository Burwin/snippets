# install WSL
winget install Microsoft.WSL

# install Docker
winget install Docker.DockerDesktop

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
