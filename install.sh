curl -L https://nixos.org/nix/install | sh

# Fix bug where ssm-user doesn't appear!
if [ -z "$USER" ]; then
  export USER=$(whoami);
fi
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
	nixpkgs.tree \
	nixpkgs.htop \
	nixpkgs.python311Packages.pip \
        nixpkgs.stow \
	nixpkgs.yarn 

stow nvim
stow tmux

# command -v zsh | sudo too -a /etc/shells

# sudo chsh -s $(which zsh) $USER

# # bundle zsh plugins
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
