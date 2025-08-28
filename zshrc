# export PATH=/usr/local/bin:${PATH}
eval "$(/opt/homebrew/bin/brew shellenv)"

#little figlet for the motivation
eval "fortune | cowsay -f stegosaurus"

# If terminal is not standard Apple_Terminal, then we can init oh my posh prompt
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.zsh-theme.omp.json)"
fi

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# SSH Agent
{ eval "${ssh-agent}"; ssh-add ~/.ssh/id_rsa --apple-use-keychain } &>/dev/null

# Plugins 
plugins=(z git ssh-agent node npm nvm sudo vscode fast-syntax-highlighting)

# Alias 
alias doserver="ssh -i ~/.ssh/digitalocean root@207.154.228.75"
alias refresh-rc="source ~/.zshrc"
alias rmescache="rm -rf ./node_modules/.cache/.eslintcache"
alias cx="pbcopy"
alias ntf="osascript -e 'display notification \"Done!\"'"
alias here="subl"
alias start_mysql="brew services start mysql";
alias wp="cd ~/WebstormProjects/";
alias ccongig="nvim ~/.config/nvim"; # stands for change config
alias v="nvim";
alias kssh="kitty +kitten ssh";

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

export PATH="$HOME/.rust_bin:$PATH"

# Java exports
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

# bun completions
[ -s "/Users/sawinjer/.bun/_bun" ] && source "/Users/sawinjer/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Python export
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"

eval "$(atuin init zsh)"

#Composer path
export COMPOSER_BIN="$HOME/.composer"
export PATH="$COMPOSER_BIN/vendor/bin:$PATH"

#Imagemagick
export DYLD_FALLBACK_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH"

# PG
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
