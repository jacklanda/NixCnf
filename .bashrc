# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/liuyang/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/liuyang/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/liuyang/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/liuyang/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# powerline-shell
function _update_ps1() {
PS1="\[\e[38;5;229m\]\[\e[48;5;100m\]☁ 洋洋 \[\e[48;5;96m\]\[\e[38;5;100m\]\[\e[38;5;229m\]\[\e[48;5;96m\] \w \[\e[48;5;237m\]\[\e[38;5;96m\]\[\e[38;5;246m\]\[\e[48;5;237m\] \$ \[\e[0m\]\[\e[38;5;237m\]\[\e[0m\] \[$(tput sgr0)\]"
    #PS1="\[$(tput bold)\]\[\033[38;5;211m\][\u\[$(tput sgr0)\]\[\033[38;5;51m\]@\[$(tput bold)\]\h\[$(tput sgr0)\]\[\033[38;5;87m\]:\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;51m\]\w\[$(tput sgr0)\]\[\033[38;5;211m\]]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias text_process="cd /data/liuyang/text_process/src"
alias crawler="cd /data/liuyang/ZhihuCrawler/"
alias ll="ls -laSh"
alias c="clear"
alias cls="clear"
alias py="python"
alias e="exit"
alias v="vim"
alias vi="vim"
alias home="cd ~"
alias .vimrc="vim ~/.vimrc"
alias .bashrc="vim ~/.bashrc"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias trash="cd ~/trash"
alias count="ls -l | grep "^-" | wc -l"
alias python="~/anaconda3/bin/python"

# 启用 Go Modules 功能
go env -w GO111MODULE=on
# 配置 GOPROXY 环境变量，以下三选一
# 1. 七牛 CDN
#go env -w  GOPROXY=https://goproxy.cn,direct
# 2. 阿里云
go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct
# 3. 官方
#go env -w  GOPROXY=https://goproxy.io,direct
