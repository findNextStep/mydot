# Path to your oh-my-zsh installation.
export ZSH=/home/pxq/.oh-my-zsh

ZSH_THEME="pxq-style"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"


# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

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

#导入共同设置 
source ~/.shrc
#导入ros相关
#source /opt/ros/indigo/setup.zsh
#source /home/pxq/erobot/devel/setup.zsh
#source /home/pxq/catkin_ws/devel/setup.zsh
# ikfast 需要
#export PYTHONPATH=$PYTHONPATH:"$(openrave-config --python-dir)"
#source /home/pxq/catkin_ws/devel/setup.zsh
