# install packages
sudo pacman -S stow

# configure stow
cp .stowrc ~/.stowrc

##TODO: make sure ssh service is installed and configured
echo "make sure ssh-agent.service is defined/copied into systemd before running this..."
systemctl --user daemon-reload
systemctl --user enable --now ssh-agent

##TODO: clone dotfiles

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
