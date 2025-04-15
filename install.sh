#!/bin/bash

echo "🌟 Installing oh-my-zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "📁 Copying .zshrc and .p10k.zsh..."
cp .zshrc ~/
[ -f .p10k.zsh ] && cp .p10k.zsh ~/

echo "🔌 Installing custom plugins and themes..."
mkdir -p ~/.oh-my-zsh/custom/plugins
mkdir -p ~/.oh-my-zsh/custom/themes

cp -r custom/plugins/* ~/.oh-my-zsh/custom/plugins/
cp -r custom/themes/* ~/.oh-my-zsh/custom/themes/

echo "✅ All done! Run 'source ~/.zshrc' to apply your settings."

