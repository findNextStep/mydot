export ZSH=~/.oh-my-zsh

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
taskwarrior
docker
stack
cabal
npm
yarn
pip
z
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
# zsh vim mode
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
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

# 命令行高亮，必须放在最后面
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## autosuggestions keybind
bindkey "^[l" autosuggest-accept
bindkey "^[k" up-line-or-search
bindkey "^[j" down-line-or-search


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
