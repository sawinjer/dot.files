# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# Plugins 
plugins=(z git node npm nvm sudo vscode zsh-syntax-highlighting)


# Alias 
alias doserver="ssh -i ~/.ssh/digitalocean root@207.154.228.75"
alias refresh-rc="source ~/.zshrc"
alias rmescache="rm -rf ./node_modules/.cache/.eslintcache"
alias cx="pbcopy"
alias ntf="osascript -e 'display notification \"Done!\"'"
alias here="subl"

# utils
function backup-do(){
  ssh -i ~/.ssh/digitalocean root@207.154.228.75 "~/dump.sh"
  scp -i ~/.ssh/digitalocean root@207.154.228.75:dump.sql $1
}
function killp(){
  sudo kill -9 $(sudo lsof -t -i:$1);
}

# NVM exports
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Java exports
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
