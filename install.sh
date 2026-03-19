#!/bin/bash

OS_TYPE="$(uname)"

if [ "$OS_TYPE" == "Darwin" ]; then
    echo "檢測到 macOS，啟動 Homebrew Bundle..."
    if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew bundle --file=./Brewfile

elif [ "$OS_TYPE" == "Linux" ]; then
    echo "檢測到 Ubuntu/Linux，啟動 APT 安裝..."
    sudo apt update
    xargs -a packages.txt sudo apt install -y

    # Ubuntu 手動安裝 Nerd Fonts (因為沒有 Cask)
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    
    # 安裝 JetBrainsMono (你清單中的第一順位)
    if [ ! -d "$FONT_DIR/JetBrainsMono" ]; then
        echo "正在為 Ubuntu 安裝 JetBrainsMono Nerd Font..."
        curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
        unzip -o JetBrainsMono.zip -d "$FONT_DIR"
        rm JetBrainsMono.zip
        fc-cache -fv
    fi
fi

# 建立設定檔連結
ln -sf ~/Dotfiles/.zshrc ~/.zshrc
ln -sf ~/Dotfiles/.vimrc ~/.vimrc

echo "✅ 所有套件與字體安裝完成！"
