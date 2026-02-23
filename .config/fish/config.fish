set -l os (uname)

if test "$os" = Darwin 
  ### Homebrew environment
  eval (/opt/homebrew/bin/brew shellenv)

  ### SSH Agent
  if not pgrep ssh-agent >/dev/null
      eval (ssh-agent -c) >/dev/null
      ssh-add ~/.ssh/id_rsa --apple-use-keychain >/dev/null 2>&1
  end
end


fish_vi_key_bindings


### Aliases
alias refresh-rc="source ~/.config/fish/config.fish"
alias rmescache="rm -rf ./node_modules/.cache/.eslintcache"
alias cx="pbcopy"
alias ntf="osascript -e 'display notification \"Done!\"'"
alias here="subl"
alias start_mysql="brew services start mysql"
alias cconfig="nvim ~/.config/nvim"
alias v="nvim"

function take 
  mkdir $argv;
  cd $argv;
end


### Rust
set -x PATH $HOME/.rust_bin $PATH
set -x PATH $HOME/.cargo/bin $PATH


if test "$os" = Darwin 
  ### Java
  set -x PATH /opt/homebrew/opt/openjdk@21/bin $PATH
  
  ### Python
  set -x PATH /opt/homebrew/opt/python@3.11/libexec/bin $PATH
  
  ### ImageMagick
  set -x DYLD_FALLBACK_LIBRARY_PATH (brew --prefix)/lib:$DYLD_FALLBACK_LIBRARY_PATH


  ### PostgreSQL
  set -x PATH /opt/homebrew/opt/libpq/bin $PATH
  set -x PATH /opt/homebrew/opt/postgresql@17/bin $PATH
end


### Composer
set -x COMPOSER_BIN $HOME/.composer
set -x PATH $COMPOSER_BIN/vendor/bin $PATH

### Local bin
set -x PATH $HOME/.local/bin $PATH

### pnpm
set -x PNPM_HOME "$HOME/Library/pnpm"
if not contains $PNPM_HOME $PATH
    set -x PATH $PNPM_HOME $PATH
end

### Bun
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH $BUN_INSTALL/bin $PATH

load_nvm > /dev/null

if status is-interactive
  if type -q pokemon-colorscripts 
    ### Random pokemon
    pokemon-colorscripts --random 
  end

  if type -q atuin
    atuin init fish | source
  end

end



# opencode
fish_add_path /home/sawinjer/.opencode/bin
