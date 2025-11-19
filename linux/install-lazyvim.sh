# INSTALL LAZYVIM

# install neovim
sudo snap install nvim --classic

# install [fzf](https://github.com/junegunn/fzf)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz
rm lazygit

# todo... https://lazyvim-ambitious-devs.phillips.codes/course/chapter-1/#_linux
