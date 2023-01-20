/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install brew-cask-completion
brew install jq zsh koekeishiya/formulae/yabai skhd gitui git cmake ccache tree ninja node git-lfs neovim ideviceinstaller
brew install --cask visual-studio-code vlc alacritty karabiner-elements

brew tap homebrew/cask-fonts && brew install --cask font-dejavu-sans-mono-nerd-font

defaults write com.apple.dock static-only -bool true; killall Dock
