# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
SH_WORD_SPLIT="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
#plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# for gnu coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH="/usr/local/Cellar/vim/7.4.1589/bin:$PATH"


# brew install binutils
# /usr/local/Cellar/binutils/2.25.1

source $HOME/.bashrc
export PATH="$HOME/local/bin:${PATH}"
export MANPATH="$HOME/local/share/man:${MANPATH}"

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/local/bin:${PATH}"
export MANPATH="$HOME/local/share/man:${MANPATH}"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
#
#
# key bindings

a(){
 bindkey "e[1~" beginning-of-line
 bindkey "e[4~" end-of-line
 bindkey "e[5~" beginning-of-history
 bindkey "e[6~" end-of-history
# bindkey "e[3~" delete-char
 bindkey "e[2~" quoted-insert
# bindkey "e[5C" forward-word
# bindkey "eOc" emacs-forward-word
# bindkey "e[5D" backward-word
# bindkey "eOd" emacs-backward-word
# bindkey "ee[C" forward-word
# bindkey "ee[D" backward-word
# bindkey "^H" backward-delete-word
 # for rxvt
 bindkey "e[8~" end-of-line
 bindkey "e[7~" beginning-of-line
 # for non RH/Debian xterm, can't hurt for RH/DEbian xterm
 bindkey "eOH" beginning-of-line
 bindkey "eOF" end-of-line
 # for freebsd console
 bindkey "e[H" beginning-of-line
 bindkey "e[F" end-of-line
 # completion in the middle of a line
 bindkey '^i' expand-or-complete-prefix
}

bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

#a

#for word split
setopt shwordsplit