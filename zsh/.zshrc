# ===================================================
#                  Oh My Zsh Stuff
# ===================================================
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="candy"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew bower web-search history history-substring-search dirhistory opp)
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 id_github

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function start_agent {
echo "Initialising new SSH agent..."
/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
echo succeeded
chmod 600 "${SSH_ENV}"
. "${SSH_ENV}" > /dev/null
/usr/bin/ssh-add;

}

export PATH=$PATH:/.rvm/bin # Add RVM to PATH for scripting
export PATH="/usr/local/mysql/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH" # add Haskell to path
source $HOME/.cargo/env # Add cargo (Rust) to path
export GOPATH=$HOME/go # Add go path
export PATH=$PATH:$GOPATH/bin
export EDITOR='nvim'

# https://homebrew-file.readthedocs.io/en/latest/installation.html
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# Set Java Version manually to 1.8 ugh
# Can us/usr/libexec/java_home -V to show you the Java JDK versions available on your computer
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8` (For example) changes your
# Java version to 1.8 (JDK 8) so I put that at the bottom of my .zshrc for now,
# until the Clojure ecosystem can handle Java 9
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

source ~/dotfiles/zsh/aliases.sh
source ~/dotfiles/zsh/npm-completion.sh
source ~/dotfiles/zsh/iTerm2-colors.sh
setopt interactivecomments

export PATH=/Users/andrescuervo/.local/bin/luna-studio:$PATH

# Set up portable Emscripten to path
# Followed this tutorial: https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html#installation-instructions
# Adding directories to PATH:
export PATH=/Users/andrescuervo/code/emsdk-portable/clang/e1.37.28_64bit:$PATH
# export PATH=/Users/andrescuervo/code/emsdk-portable/node/4.1.1_64bit/bin:$PATH
export PATH=/Users/andrescuervo/code/emsdk-portable/emscripten/1.37.28:$PATH
# Setting environment variables:
export EMSDK=/Users/andrescuervo/code/emsdk-portable:$PATH
export BINARYEN_ROOT=/Users/andrescuervo/code/emsdk-portable/clang/e1.37.28_64bit/binaryen:$PATH
export EMSCRIPTEN=/Users/andrescuervo/code/emsdk-portable/emscripten/1.37.28:$PATH
#
# Add these lines for Carp installation: https://github.com/carp-lang/Carp/blob/master/docs/Install.md
export PATH=~/.local/bin:$PATH
export CARP_DIR=~/Carp/


export MAKEFLAGS="-j8 -s"
