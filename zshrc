export ZSH=/home/pxq/.oh-my-zsh

ZSH_THEME="pxq-style"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git autojump)

source $ZSH/oh-my-zsh.sh


# 定义terminal外启动app的函数
_outTerminal(){
    screen $@ > /dev/null 2>&1 &
}

#文件打开方式自定义
alias -s py=python
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
alias -s jpg=feh
alias -s png=feh
alias -s mp4=mplayer
alias -s pdf="_outTerminal evince"

#导入共同设置 
source ~/.shrc
#导入ros相关
source /opt/ros/$(ls /opt/ros)/setup.zsh
source ~/erobot/devel/setup.zsh
#source ~/catkin_ws/devel/setup.zsh
# ikfast 需要
#export PYTHONPATH=$PYTHONPATH:"$(openrave-config --python-dir)"

# 命令行高亮，必须放在最后面
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
