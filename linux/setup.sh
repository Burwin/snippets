# install packages
sudo pacman -S stow

# configure stow
# TODO

##TODO: make sure ssh service is installed and configured
systemctl --user daemon-reload
systemctl --user enable --now ssh-agent

### most of these are setup automatically by omarchy... skip for now
# install curl
# install/configure terminal
# install 1password
# setup printer
# install automatic backup
# install git
# configure github ssh
# install neovim
# install docker
