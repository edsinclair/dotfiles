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
plugins=(brew bundler cap docker gem git github osx rails redis-cli ruby terminalapp)

# editor
EDITOR=vim

# Version managers
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source /usr/local/share/zsh/site-functions/*
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Sandbox managers

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/github/tallygo

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
