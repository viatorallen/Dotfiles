#!/bin/bash

# 自動獲取腳本所在資料夾的絕對路徑
DOTFILES_DIR=$(cd "$(dirname "$0")"; pwd)
OS_TYPE="$(uname)"

echo "🚀 開始執行 Dotfiles 安裝 (系統: $OS_TYPE)"

if [ "$OS_TYPE" == "Darwin" ]; then
    echo "🍎 檢測到 macOS，啟動 Homebrew Bundle..."
    if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew bundle --file="$DOTFILES_DIR/Brewfile"

elif [ "$OS_TYPE" == "Linux" ]; then
    echo "🐧 檢測到 Ubuntu/Linux，啟動 APT 安裝..."
    sudo apt update
    # 確保基礎套件存在
    sudo apt install -y curl git unzip xargs
    xargs -a "$DOTFILES_DIR/packages.txt" sudo apt install -y

    # Ubuntu 手動安裝 Nerd Fonts
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    if [ ! -d "$FONT_DIR/JetBrainsMono" ]; then
        echo "📦 安裝 JetBrainsMono Nerd Font..."
        curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
        unzip -o JetBrainsMono.zip -d "$FONT_DIR"
        rm JetBrainsMono.zip
        fc-cache -fv
    fi
fi

# 檢查並安裝 Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "🪄 安裝 Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# --- 自動下載 Zsh 插件 ---
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
mkdir -p "$ZSH_CUSTOM_DIR/plugins"

install_zsh_plugin() {
    local PLUGIN_NAME=$1
    local PLUGIN_URL=$2
    if [ ! -d "$ZSH_CUSTOM_DIR/plugins/$PLUGIN_NAME" ]; then
        echo "🔌 安裝插件: $PLUGIN_NAME..."
        git clone --depth 1 "$PLUGIN_URL" "$ZSH_CUSTOM_DIR/plugins/$PLUGIN_NAME"
    fi
}

install_zsh_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
install_zsh_plugin "zsh-syntax-highlighting" "https://github.com/zsh-syntax-highlighting/zsh-syntax-highlighting.git"
install_zsh_plugin "romkatv/powerlevel10k" "https://github.com/romkatv/powerlevel10k.git"

# 建立設定檔連結 (Symbolic Links)
echo "🔗 建立設定檔連結..."
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
# 如果你有 .p10k.zsh 也一併連結
[ -f "$DOTFILES_DIR/.p10k.zsh" ] && ln -sf "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

echo "✅ 所有套件與環境設定完成！請重啟終端機。"
