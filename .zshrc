# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mvoropaiev/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  aws
  docker
  docker-compose
  git
  git-extras
  httpie
  rsync
  terraform
  tig
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# aliases
# alias dc="WORKER_UID=$(id -u) WORKER_GID=$(id -g) docker-compose --file docker-compose.macos.yml"
alias dc="docker-compose"
compdef dc='docker-compose'
alias ll='ls -lG'
alias macvim='/Applications/MacVim.app/Contents/MacOS/Vim'

# more aliases
if [ -f ~/.zsh_aliases.zsh ]; then
  . ~/.zsh_aliases.zsh
fi

# path
# export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH" # gem environment gemdir
# export PATH="/usr/local/opt/ruby/bin:$PATH" # brew --prefix ruby
export PATH="/Users/mvoropaiev/Library/Python/3.8/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/ansible@1.9/bin:$PATH"

# precmd
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# powerline
# pip3 install powerline-status
# pip3 show powerline-status
powerline-daemon -q
. /Users/mvoropaiev/Library/Python/3.8/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

_setup_fzf() {
  local color00='#282828'
  local color01='#3c3836'
  local color02='#504945'
  local color03='#665c54'
  local color04='#bdae93'
  local color05='#d5c4a1'
  local color06='#ebdbb2'
  local color07='#fbf1c7'
  local color08='#fb4934'
  local color09='#fe8019'
  local color0A='#fabd2f'
  local color0B='#b8bb26'
  local color0C='#8ec07c'
  local color0D='#83a598'
  local color0E='#d3869b'
  local color0F='#d65d0e'

  export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
  export FZF_DEFAULT_OPTS="
    --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
}

_setup_fzf
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"

eval "$(direnv hook zsh)"
export PATH="/usr/local/opt/ruby@2.7/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
