# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

export ZSH="$HOME/.oh-my-zsh"

export PATH="$HOME/.cargo/bin:$PATH"

plugins=(
  brew
  docker
  docker-compose
  fast-syntax-highlighting
  git
  laravel
  macos
  npm
  rails
  sudo
  themes
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ..="z .."
alias dev="z /Volumes/Projects/Prozon/dev"
alias prozon="z /Volumes/Projects/Prozon"
alias private="z /Volumes/Projects/Private"
alias ll="eza -la"
alias container-php="docker exec -it docker-ps-php-1 bash"
alias container-web="docker exec -it docker-ps-web-1 bash"
alias vim=nvim
alias gb="git branch -l | cat"
alias tree="eza --tree"
alias deploy-db="docker exec -it docker-ps-sgbd-1 /deployBdd.sh"
alias deploy-img="docker exec -it docker-ps-sgbd-1 /deployImages.sh"

alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

sphp() {
  if [[ -z "$1" ]]; then
    echo "Error: You must provide a PHP version."
    echo "Usage: sphp <version>"
    return 1
  fi

  brew unlink php
  brew unlink php@7.0
  brew link --force --overwrite "php@$1"
}

# Catppuccin mocha
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

source <(fzf --zsh)

export PATH="/Users/anthony/Library/Python/3.9/bin:$PATH"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
