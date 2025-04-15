#!/bin/bash

# =====================================
# 🔧 dotfiles install.sh
# - installs oh-my-zsh if missing
# - sets up .zshrc, .p10k.zsh
# - adds custom theme and plugins
# =====================================

set -e  # exit on error

# 1. oh-my-zsh 설치
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "🌟 Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "📁 oh-my-zsh already installed. Skipping..."
fi

# 2. zsh-syntax-highlighting 자동 설치
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  echo "🧠 Installing zsh-syntax-highlighting plugin..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
else
  echo "🔍 zsh-syntax-highlighting already installed."
fi

# 3. .zshrc, .p10k.zsh 복사
echo "📁 Copying zsh config files..."
cp .zshrc ~/
[ -f .p10k.zsh ] && cp .p10k.zsh ~/ || echo "⚠️  .p10k.zsh not found, skipping."

# 4. agnoster 테마 복사
echo "🎨 Installing agnoster custom theme..."
mkdir -p ~/.oh-my-zsh/custom/themes/agnoster
cp custom/themes/agnoster/agnoster.zsh-theme ~/.oh-my-zsh/custom/themes/agnoster/

# 5. 플러그인 복사 (기타 수동 플러그인이 있다면 여기에 추가)
if [ -d "custom/plugins" ]; then
  echo "🔌 Copying additional plugins..."
  cp -r custom/plugins/* ~/.oh-my-zsh/custom/plugins/
fi

# 6. 완료
echo "✅ Done! Run 'source ~/.zshrc' to apply your settings."

