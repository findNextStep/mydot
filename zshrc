MY_SHELL="zsh"
export ZSH=~/.oh-my-zsh

HOSTNAME=$HOST

ZSH_THEME="pxq-style"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
git
git-extras
git-remote-branch
docker
stack
cabal
fast-syntax-highlighting
npm
yarn
pip
cargo
rust
rustup
z
zsh-autosuggestions
zsh-vimto
Snappy
)

source $ZSH/oh-my-zsh.sh

PATH=$PATH:~/.oh-my-zsh/custom/plugins/zsh-git-prompt/src/.bin

source ~/.oh-my-zsh/custom/plugins/zsh-git-prompt/zshrc.sh

[ -f ~/.oh-my-zsh/custom/plugins/zsh-git-prompt/src/.bin/gitstatus ] && GIT_PROMPT_EXECUTABLE="haskell" || echo "git prompt need to build\nsee ~/.oh-my-zsh/custom/plugins/zsh-git-prompt/"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
# 分隔各个模块
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
# 未add的更改
ZSH_THEME_GIT_PROMPT_STAGED=" \ue0b1%{$fg[reset]%}✚ %{%G%}"
# 未处理的冲突
ZSH_THEME_GIT_PROMPT_CONFLICTS=" \ue0b1%{$fg[red]%}%{✖ %G%}"
# 未提交的记录
ZSH_THEME_GIT_PROMPT_CHANGED=" \ue0b1%{$fg[reset]%}%{● %G%}"
# 落后远程分支（需要pull更新）
ZSH_THEME_GIT_PROMPT_BEHIND="% \ue0b1{↓ %G%}"
# 领先远程分支（需要push更新）
ZSH_THEME_GIT_PROMPT_AHEAD=" \ue0b1%{↑ %G%}"
# 有未跟踪的内容
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{\uf42e%G%}"

source ~/.oh-my-zsh/custom/plugins/zsh-vimto/zsh-vimto.zsh


# highlighting theme
fast-theme -q zdharma

# zsh vim mode
# Better searching in command mode
# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# 避免esc延时
KEYTIMEOUT=1

# 定义terminal外启动app的函数
_outTerminal(){
    screen $@ > /dev/null 2>&1 &!
    tput reset
}

alias img_shower="feh --scale-down"

#文件打开方式自定义
alias -s sh=sh
alias -s zsh=zsh
alias -s bash=bash
alias -s ppt="_outTerminal wpp"
alias -s pptx="_outTerminal wpp"
alias -s doc="_outTerminal wps"
alias -s docx="_outTerminal wps"
alias -s xls="_outTerminal et"
alias -s xlsx="_outTerminal et"
alias -s md="_outTerminal typora"
alias -s jpg=img_shower
alias -s png=img_shower
alias -s mp4=mplayer
alias -s pdf="_outTerminal evince"

#导入ros相关
# source /opt/ros/$(ls /opt/ros)/setup.zsh
# source ~/erobot/devel/setup.zsh
#source ~/catkin_ws/devel/setup.zsh
#导入共同设置
source ~/.shrc
# ikfast 需要
#export PYTHONPATH=$PYTHONPATH:"$(openrave-config --python-dir)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## autosuggestions keybind
bindkey "גּ " autosuggest-accept
bindkey "גּk" up-line-or-search
bindkey "גּj" down-line-or-search


# copy
x-paste() {
    PASTE=$(xclip -selection clipboard -o)
    LBUFFER="$LBUFFER${RBUFFER:0:1}"
    RBUFFER="$PASTE${RBUFFER:1:${#RBUFFER}}"
}
zle -N x-paste

bindkey -M vicmd "p" x-paste

copy-to-xclip() {
    [[ "$REGION_ACTIVE" -ne 0 ]] && zle copy-region-as-kill
    print -rn -- $CUTBUFFER | xclip -selection clipboard -i
}
zle -N copy-to-xclip
bindkey -M vicmd "y" copy-to-xclip

#历史纪录条目数量
export HISTSIZE=1000000
#注销后保存的历史纪录条目数量
export SAVEHIST=500000
#以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
#如果连续输入的命令相同，历史纪录中只保留一个
setopt HIST_IGNORE_DUPS
#为历史纪录中的命令添加时间戳
setopt EXTENDED_HISTORY
#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
setopt PUSHD_IGNORE_DUPS

#在命令前添加空格，不将此命令添加到纪录文件中
setopt HIST_IGNORE_SPACE
#}}}
