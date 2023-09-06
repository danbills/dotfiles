
curl -L https://nixos.org/nix/install | sh

. ~/.nix-profile/etc/profile.d/nix.sh

nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.ripgrep \
	nixpkgs.fd \
	nixpkgs.fzf \
	nixpkgs.entr \
	nixpkgs.ack \
	nixpkgs.curl \
	nixpkgs.wget \
	nixpkgs.bat \
	nixpkgs.direnv \
	nixpkgs.yarn 

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

stow nvim

command -v zsh | sudo too -a /etc/shells

sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
