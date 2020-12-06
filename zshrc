# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '

# logfile=~/$(mktemp zsh_profile.XXXXXXXX)
# echo "Logging to $logfile"
# exec 3>&2 2>$logfile

# setopt XTRACE
MY_SHELL="zsh"

HOSTNAME=$HOST

ZSH_THEME="pxq-style"

# fast vim switch
KEYTIMEOUT=1

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"


setopt interactive_comments hist_ignore_dups  octal_zeroes   no_prompt_cr
setopt no_hist_no_functions no_always_to_end  append_history list_packed
setopt inc_append_history   complete_in_word  no_auto_menu   auto_pushd
setopt pushd_ignore_dups    no_glob_complete  no_glob_dots   c_bases
setopt numeric_glob_sort    no_share_history  promptsubst    auto_cd
setopt rc_quotes            extendedglob      notify
autoload -Uz rgzh rgsrc rgdata pslist ebindkey expand_alias palette printc oomscore pb
autoload -Uz zcalc zmv

zmodload zsh/zpty

[[ ! -f ~/.zinit/bin/zinit.zsh ]] && {
    command mkdir -p ~/.zinit
    command git clone https://github.com/zdharma/zinit ~/.zinit/bin
}

source "$HOME/.zinit/bin/zinit.zsh"


zinit for \
    OMZ::lib/git.zsh \
    OMZ::lib/clipboard.zsh \
    OMZ::lib/key-bindings.zsh \
    OMZ::lib/completion.zsh \
    OMZ::lib/correction.zsh \
    OMZ::lib/history.zsh \
    OMZ::lib/theme-and-appearance.zsh \
    OMZ::plugins/git/git.plugin.zsh \
    OMZ::plugins/git-extras/git-extras.plugin.zsh


zinit ice as="completion"
zinit snippet https://github.com/alacritty/alacritty/blob/master/extra/completions/_alacritty
# zinit as="completion" for \
    # PZT::modules/docker/_docker \
    # OMZ::plugins/cabal_/cabal \
    # OMZ::plugins/xcode/_xcode \
    # OMZ::plugins/fd/_fd
# zinit light-mode for \
        # agkozak/zsh-z
zinit load agkozak/zsh-z
zinit light-mode for \
    blockf \
        zsh-users/zsh-completions \
    as="program" atclone="rm -f ^(rgg|agv)" \
        lilydjwg/search-and-view \
    atclone="dircolors -b LS_COLORS > c.zsh" atpull='%atclone' pick='c.zsh' \
        trapd00r/LS_COLORS

zinit light-mode for \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    romkatv/gitstatus \
    zsh-vi-more/vi-motions

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions
# autoload -Uz compinit
# compinit
# # zinit 出于效率考虑会截获 compdef 调用，放到最后再统一应用，可以节省不少时间
# zinit cdreplay -q

zinit ice depth=1
zinit light romkatv/powerlevel10k


# highlighting theme
# fast-theme -q zdharma
# 定义terminal外启动app的函数
_outTerminal(){
    screen $@ > /dev/null 2>&1 &!
    tput reset
}

alias img_shower="feh --scale-down"

if [ "$(uname -s)" = "Darwin" ];then
    alias typora="open -a Typora"
fi

#文件打开方式自定义
case "$(uname -s)" in
    Linux*)
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
        ;;
    Darwin*)
        alias -s sh=sh
        alias -s zsh=zsh
        alias -s bash=bash
        alias -s md="open -a Typora"
        alias -s pdf="_outTerminal evince"
        ;;
esac

# copy
x-paste() {
    case "$(uname -s)" in
        Linux*) 
            PASTE=$(xclip -selection clipboard -o)
            ;;
        Darwin*)
            PASTE=$(pbpaste)
            ;;
    esac
    LBUFFER="$LBUFFER${RBUFFER:0:1}"
    RBUFFER="$PASTE${RBUFFER:1:${#RBUFFER}}"
}

zle -N x-paste
bindkey -M vicmd "p" x-paste

copy-to-xclip() {
    [[ "$REGION_ACTIVE" -ne 0 ]] && zle copy-region-as-kill
    case "$(uname -s)" in
        Linux*) 
            print -rn -- $CUTBUFFER | xclip -selection clipboard -i
            ;;
        Darwin*)
            print -rn -- $CUTBUFFER | pbcopy
            ;;
    esac
}
zle -N copy-to-xclip
bindkey -M vicmd "y" copy-to-xclip
## autosuggestions keybind
bindkey "גּ " autosuggest-accept
## super + l in mac
bindkey "¬" autosuggest-accept
bindkey "^J" autosuggest-accept
bindkey "גּl" autosuggest-accept
bindkey "גּk" up-line-or-search
bindkey "˚" up-line-or-search
bindkey "גּj" down-line-or-search
bindkey "∆" down-line-or-search

bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey "^K" up-line-or-beginning-search
bindkey "^J" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

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


# 自动提示中使用自动补全的项目
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source ~/.shrc

# fzf just good
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# __git_aliased_command requires 1 argument
__git_aliased_command ()
{
	local word cmdline=$(__git config --get "alias.$1")
	for word in $cmdline; do
		case "$word" in
		\!gitk|gitk)
			echo "gitk"
			return
			;;
		\!*)	: shell command alias ;;
		-*)	: option ;;
		*=*)	: setting env ;;
		git)	: git itself ;;
		\(\))   : skip parens of shell function definition ;;
		{)	: skip start of shell helper function ;;
		:)	: skip null command ;;
		\'*)	: skip opening quote after sh -c ;;
		*)
			echo "$word"
			return
		esac
	done
}

# unsetopt XTRACE
# exec 2>&3 3>&-

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
 __conda_setup="$('/Users/panxueqian/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/panxueqian/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/panxueqian/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/panxueqian/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
