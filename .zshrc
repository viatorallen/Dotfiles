# Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# 系統環境判斷
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS (M4 Apple Silicon)
    [[ -f "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
elif [[ "$(uname)" == "Linux" ]]; then
    # Ubuntu / Linux
    export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"
fi

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# --- 個人 Aliases ---
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv venv && source venv/bin/activate'

# lsd 檢查
if command -v lsd >/dev/null 2>&1; then
    alias ls='lsd'
    alias ll='lsd -lh'
    alias la='lsd -a'
    alias lt='lsd --tree'
else
    alias ll='ls -lh'
    alias la='ls -a'
fi

alias zconf='vim ~/.zshrc && source ~/.zshrc'
alias vconf='vim ~/.vimrc'
alias cls='clear'

# 語法編碼強化
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
