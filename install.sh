# TODO(reece): Platform specific switches

# TODO(reece): These program install checks are going to get repetitive, factor out
# Brew
if ! command -v brew &> /dev/null
then
	echo "Installing Brew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Brew already installed, skipping"
fi

# Rustup
if ! command -v rustup &> /dev/null
then
	echo "Installing Rustup..."
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
	echo "Rustup already installed, skipping"
fi



# Brew installs
echo "Installing Brew programs"
brew install --cask alfred
brew install --cask alt-tab
brew install --cask docker
brew install --cask firefox
brew install --cask jetbrains-toolbox
brew install --cask karabiner-elements
brew install --cask monitorcontrol
brew install --cask mullvadvpn
brew install --cask notion
brew install --cask rectangle
brew install --cask spotify
brew install --cask slack
brew install --cask visual-studio-code

brew install htop
brew install fzf
brew install nvm
brew install rbenv
brew install tmux
brew install neovim

# Cargo installs
echo "Installing Cargo programs"
cargo install ripgrep
cargo install exa

# Node
echo "Installing node"
nvm install node

# Vundle
VUNDLE_DIRECTORY = $HOME/.vim/bundle/Vundle.vim
if [ -d "$VUNDLE_DIRECTORY" ]; then
  echo "$VUNDLE_DIRECTORY does exist. Installing Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  cd .vim/bundle/coc.nvim
  npm install
else
	echo $VUNDLE_DIRECTORY exists. Assuming Vundle already installed"
fi

