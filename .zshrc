# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export EDITOR=/usr/bin/vim
export ZSH_DISABLE_COMPFIX=true
# 设置mac下mysql环境变量
export PATH=${PATH}:/usr/local/mysql/bin/
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cloud"

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

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
    z
    wd
    git
    themes
    last-working-dir
    extract
    web-search
    zsh-autosuggestions
    zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

bindkey ',' autosuggest-accept

# 设置zsh命令行代理
# Manjaro Linux下：
# alias setproxy='export ALL_PROXY=socks5://127.0.0.1:1088'
# alias unsetproxy='unset ALL_PROXY'
# MacOs 下：
alias setproxy='export http_proxy=http://127.0.0.1:1087'
alias unsetproxy='export https_proxy=http://127.0.0.1:1087'

alias pacman='sudo pacman'
alias cls='clear'
alias c='clear'
alias py='clear;ptpython'
alias e='exit'
alias v='vim'
alias vi='vim'
alias -s py=vim
alias -s c=vim
alias -s cpp=vim
alias -s go=vim
alias -s txt=vim
alias cproj='/home/jacklanda/桌面/cproj/'
alias linux='/home/jacklanda/桌面/'
alias mac='~/Desktop'
alias desktop='/home/jacklanda/桌面'
alias windows='/run/media/jacklanda/系统/Users/Administrator/Desktop/'
alias show='find -name'
alias anal='ncdu'
alias t='trans'
alias clock='watch -n1 "date '+%D%n%T'|figlet -k"'
alias .vimrc='vim ~/.vimrc'
alias .zshrc='vim ~/.zshrc'
alias resetplasma='sh /home/jacklanda/script/reset_plasma.sh'
alias myblog='cd ~/myblog'
alias rm="rm -i"
# del(){mv $@ /home/jacklanda/.local/share/Trash/files/}
alias start="sudo systemctl start"
alias stop="sudo systemctl stop"
alias status="sudo systemctl status"
alias restart="sudo systemctl restart"
alias login="/home/jacklanda/script/login_school_network --login"
alias logout="/home/jacklanda/script/login_school_network --logout"
alias remote="ssh -p 2222 liuyang@relay01.data-baker.com"
alias count="ls -l | grep "^-" | wc -l"
alias wordfreq="sh ~/script/word_freq.sh"
alias client="redis-cli"
alias redis-out="sudo rdb -c memory /var/lib/redis/dump.rdb > /home/jacklanda/桌面/redis_mem.csv"
alias site-packages="cd ~/.local/lib/python3.9/site-packages"
# 替换find为Rust的实现版本fd
alias find="fd -IH"
alias find-content="fd .|xargs grep -ri"
# 替换grep为Rust的实现版本rg
alias grep="rg -uuu"
# 替换ls为Rust的实现版本exa
alias ls="exa"
# 替换cat为Rust的实现版本bat
alias cat="bat"
alias info="tldr"
alias spark="pyspark"
alias python="python3"
alias mysql="mycli -u root"
alias rs="rustc $@"

# User configuration
# 添加Rust可执行文件的环境变量
export PATH="$HOME/.cargo/bin:$PATH"
# 设置Rust国内镜像
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

# 设置Go相关环境变量
export GOROOT=$HOME/.go/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/.gopath
export PATH=$PATH:$GOPATH/bin
# 设置Go代理
export GO111MODULE=on
export GOPROXY=https://goproxy.io

# 设置Java环境
export PATH="/usr/local/opt/openjdk@8/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk@8/include"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/didi/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/didi/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/didi/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/didi/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
PROMPT=$(echo $PROMPT | sed 's/(base) //')

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
