# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="edsinclair"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler docker gem git github history macos rails redis-cli ruby)

# editor
EDITOR=vim

# Version managers
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/share/chruby/auto.sh

FPATH="$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh
export PGHOST=localhost
export AUDIBLE_BYTES=030f8504

# Customize to your needs...
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Go
export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec
export PATH=$PATH:$GOPATH/bin

# Sandbox managers
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/github/befinvestments
eval "$(direnv hook zsh)"
fpath=(/Users/eirik/.gem/ruby/3.3.6/bundler/gems/timetrap-170929080e36/completions/zsh $fpath)


export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/eirik/.sdkman"
[[ -s "/Users/eirik/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/eirik/.sdkman/bin/sdkman-init.sh"
