# INSTALL LAZYVIM

# install neovim
sudo snap install nvim --classic

# install [fzf](https://github.com/junegunn/fzf)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# install [lazygit](https://github.com/jesseduffield/lazygit)
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz
rm lazygit

# install [ripgrep](https://github.com/BurntSushi/ripgrep)
RIPGREP_VERSION=$(curl -sL "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" -H "Accept: application/vnd.github+json" | jq -r .tag_name)
RIPGREP_FILE="ripgrep_$RIPGREP_VERSION-1_amd64.deb"
RIPGREP_URL="https://github.com/BurntSushi/ripgrep/releases/download/$RIPGREP_VERSION/$RIPGREP_FILE"
curl -LO $RIPGREP_URL
sudo dpkg -i $RIPGREP_FILE
rm $RIPGREP_FILE

# install [fd (fd-find)](https://github.com/sharkdp/fd)
# todo: get version
# todo: download package
# todo: install package
# todo: add link to fd
# todo: add $HOME/.local/bin to path (for which terminal?)

# todo... https://lazyvim-ambitious-devs.phillips.codes/course/chapter-1/#_linux
