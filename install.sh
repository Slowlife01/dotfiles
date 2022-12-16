#!/bin/bash

set -eufo pipefail

echo ""
echo "🤚  This script will setup .dotfiles for you."
read -n 1 -r -s -p $'    Press any key to continue or Ctrl+C to abort...\n\n'

# Install Homebrew
if ! command -v brew >/dev/null 2>&1; then
   echo '🍺  Installing Homebrew' && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install Fish
brew list fish >/dev/null 2>&1 ||
  (echo '🐟  Installing Fish' && brew install fish)

# Install chezmoi
command -v chezmoi >/dev/null 2>&1 ||
  (echo '👊  Installing chezmoi' && brew install chezmoi)

if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
  echo "🚸  chezmoi already initialized"
  echo "    Reinitialize with: 'chezmoi init https://github.com/Slowlife01/dotfiles.git'"
else
  chezmoi init https://github.com/Slowlife01/dotfiles.git
fi

chezmoi apply
