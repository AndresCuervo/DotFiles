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
export PATH="$HOME/.cargo/bin:$PATH" # Add cargo (Rust) to path
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

# Add: https://github.com/kripken/emscripten
# This source script prints out some info whenever a shell spawns though, so
# I'm piping it to dev/null to supress this.
#
# Output for reference:
# Adding directories to PATH:
# PATH += /Users/andrescuervo/code/emsdk
# PATH += /Users/andrescuervo/code/emsdk/clang/e1.37.36_64bit
# PATH += /Users/andrescuervo/code/emsdk/node/8.9.1_64bit/bin
# PATH += /Users/andrescuervo/code/emsdk/emscripten/1.37.36
#
# Setting environment variables:
# EMSDK = /Users/andrescuervo/code/emsdk
# EM_CONFIG = /Users/andrescuervo/.emscripten
# BINARYEN_ROOT = /Users/andrescuervo/code/emsdk/clang/e1.37.36_64bit/binaryen
# EMSCRIPTEN = /Users/andrescuervo/code/emsdk/emscripten/1.37.36
source ~/code/emsdk/emsdk_env.sh &> /dev/null

# Add these lines for Carp installation: https://github.com/carp-lang/Carp/blob/master/docs/Install.md
export PATH=/Users/andrescuervo/.local/bin:$PATH
export CARP_DIR=/Users/andrescuervo/Carp/

# Homebrew CLANG + LLVM magic:
# from: https://embeddedartistry.com/blog/2017/2/20/installing-clangllvm-on-osx
export PATH="/usr/local/opt/llvm/bin:$PATH"
# export CC="clang"
# export CXX=$(CC)++

export MAKEFLAGS="-j8 -s"
# Magic Leap stuff, for future reference:
# source ~/MagicLeap/mlsdk/v0.11.1/envsetup.sh
#
# cd ~/MagicLeap/mlsdk/v0.11.1/VirtualDevice
# source mlvdsetup.sh
# cd - &> /dev/null
#
# # The following assumes GLAD downloaded & installed in the specified place
# #     GLWF install from ML docs: http://glad.dav1d.de/#profile=core&specification=gl&api=gl%3D4.3&api=gles1%3Dnone&api=gles2%3Dnone&api=glsc2%3Dnone&language=c&loader=on
# # And GLFW installed via standard Homebrew (brew install glfw)
# export GLFW_INCS=/usr/local/Cellar/glfw/3.2.1/include
# export GLFW_LIBS=/usr/local/Cellar/glfw/3.2.1/lib
# export GLAD_ROOT=~/code/glad
