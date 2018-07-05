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


#文件打开方式自定义
alias -s py=python
alias -s sh=sh
alias -s zsh=zsh
alias -s bash=bash
alias -s ppt=wpp
alias -s pptx=wpp
alias -s doc=wps
alias -s docx=wps
alias -s xls=et
alias -s xlsx=et
alias -s md=typora
alias -s jpg=feh
alias -s png=feh
alias -s mp4=mplayer
alias -s pdf=evince

#导入共同设置 
source ~/.shrc
#导入ros相关
#source /opt/ros/indigo/setup.zsh
#source /home/pxq/erobot/devel/setup.zsh
#source /home/pxq/catkin_ws/devel/setup.zsh
# ikfast 需要
#export PYTHONPATH=$PYTHONPATH:"$(openrave-config --python-dir)"
#source /home/pxq/catkin_ws/devel/setup.zsh

# 命令行高亮，必须放在最后面
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
