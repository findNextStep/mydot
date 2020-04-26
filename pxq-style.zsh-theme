# vim:ft=zsh ts=2 sw=2 sts=2
# agnoster's Theme - https://gist.github.com/3712874

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'

case ${SOLARIZED_THEME:-dark} in
    light) CURRENT_FG='white';;
    *)     CURRENT_FG='black';;
esac

# Special Powerline characters

# test () {
  LC_ALL="" LC_CTYPE="zh_CN.UTF-8"
  readonly SEGMENT_SEPARATOR="\ue0b0"
  readonly SEGMENT_SEPARATOR_DIFF="\ue0b2"
  if [ $MY_SHELL = "zsh" ];then
    readonly _color_front_set="%{"
    readonly _color_back_set="%}"
  else
    readonly _color_front_set=''
    readonly _color_back_set=''
  fi
  # SEGMENT_SEPARATOR=$'\uf0da '
  # SEGMENT_SEPARATOR_DIFF=$'\ue0be '
# }

_color_reset="$_color_front_set\e[0m$_color_back_set"
# 使用%{%}防止终端颜色提示符被记入长度计量中影响补全的位置
set_terminal_fg(){
  case $1 in
    "reset")
      echo "$_color_front_set\e[39m$_color_back_set"
      ;;
    "black")
      set_terminal_fg 0
      ;;
    "maroon")
      set_terminal_fg 1
      ;;
    "green")
      set_terminal_fg 2
      ;;
    "olive")
      set_terminal_fg 3
      ;;
    "navy")
      set_terminal_fg 4
      ;;
    "purple")
      set_terminal_fg 5
      ;;
    "teal")
      set_terminal_fg 6
      ;;
    "silver")
      set_terminal_fg 7
      ;;
    "grey")
      set_terminal_fg 8
      ;;
    "red")
      set_terminal_fg 9
      ;;
    "lime")
      set_terminal_fg 10
      ;;
    "yellow")
      set_terminal_fg 11
      ;;
    "blue")
      set_terminal_fg 12
      ;;
    "fuchisa")
      set_terminal_fg 13
      ;;
    "aqua")
      set_terminal_fg 14
      ;;
    "white")
      set_terminal_fg 15
      ;;
    "")
      ;;
    "NONE")
      ;;
    "cyan")
      set_terminal_fg 51
      ;;
    *)
      color="$_color_front_set\e[38;5;$1m$_color_back_set"
      if [ $MY_SHELL = "zsh" ];then
        print -n $color
      else
        echo -ne $color
      fi
      ;;
  esac

}
set_terminal_bg(){
  case $1 in
    "reset")
    print -n "$_color_front_set\e[49m$_color_back_set"
      ;;
    "black")
      set_terminal_bg 0
      ;;
    "maroon")
      set_terminal_bg 1
      ;;
    "green")
      set_terminal_bg 2
      ;;
    "olive")
      set_terminal_bg 3
      ;;
    "navy")
      set_terminal_bg 4
      ;;
    "purple")
      set_terminal_bg 5
      ;;
    "teal")
      set_terminal_bg 6
      ;;
    "silver")
      set_terminal_bg 7
      ;;
    "grey")
      set_terminal_bg 8
      ;;
    "red")
      set_terminal_bg 9
      ;;
    "lime")
      set_terminal_bg 10
      ;;
    "yellow")
      set_terminal_bg 11
      ;;
    "blue")
      set_terminal_bg 12
      ;;
    "fuchisa")
      set_terminal_bg 13
      ;;
    "aqua")
      set_terminal_bg 14
      ;;
    "white")
      set_terminal_bg 15
      ;;
    "")
      ;;
    "NONE")
      ;;
    "cyan")
      set_terminal_bg 51
      ;;
    *)
      color="$_color_front_set\e[48;5;$1m$_color_back_set"
      if [ $MY_SHELL = "zsh" ];then
        print -n $color
      else
        echo -ne $color
      fi
      ;;
  esac
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local SHOW=""$_color_reset
  local bg fg
  [[ -n $1 ]] && bg="$1" || bg=""
  [[ -n $2 ]] && fg="$2" || fg=""
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    SHOW=$SHOW"$(set_terminal_bg $CURRENT_BG) $(set_terminal_bg $bg)$(set_terminal_fg $CURRENT_BG)$SEGMENT_SEPARATOR"
  elif [[ $CURRENT_BG != 'NONE' ]];then
    SHOW=$SHOW"$(set_terminal_bg $CURRENT_BG) $(set_terminal_fg 0)"
  fi
  if [[ $CURRENT_BG != 'NONE' ]];then
    SHOW=$SHOW"$(set_terminal_fg $2)$(set_terminal_bg $1) "
  else
    SHOW=$SHOW"$(set_terminal_fg $2)$(set_terminal_bg $1)"
  fi
  CURRENT_BG=$1
  SHOW=$SHOW"$_color_front_set\e[1m$_color_back_set"
  [[ -n $3 ]] &&  SHOW=$SHOW$3
  print -n $SHOW
}
prompt_segment_diff() {
  echo -ne $_color_reset
  local bg fg
  echo -n "$_color_front_set$(set_terminal_bg $CURRENT_BG)$_color_back_set$_color_front_set$(set_terminal_fg $1)$_color_back_set$SEGMENT_SEPARATOR_DIFF"
  echo -n "$_color_front_set$(set_terminal_fg $2)$_color_back_set$_color_front_set$(set_terminal_bg $1)$_color_back_set"
  CURRENT_BG=$1
  echo -n "$_color_front_set\e[1m$_color_back_set"
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "$_color_front_set$(set_terminal_fg $CURRENT_BG)\e[49m$_color_back_set$SEGMENT_SEPARATOR$_color_front_set$(set_terminal_fg reset)$_color_back_set"
  else
    print -n "$_color_front_set$(set_terminal_bg reset)$(set_terminal_fg reset)$_color_back_set"
  fi
  CURRENT_BG='NONE'
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
    if [[ $USER == "root" ]];then
        prompt_segment red white "$USER"
    else
        prompt_segment 4 white "$USER"
    fi
    if [[ -n "$SSH_CLIENT" ]];then
      prompt_segment yellow red "直$HOSTNAME"
    elif [ ${HOSTNAME:0:3} != "pxq" ];then
      prompt_segment black white "$HOSTNAME"
    fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  if ( which gitstatus_query > /dev/null );then
    gitstatus_query next
    if [ $VCS_STATUS_RESULT = "ok-sync" ];then
      GIT_PRO=${${VCS_STATUS_LOCAL_BRANCH:-@$(print ${VCS_STATUS_COMMIT} | cut -c 1-8)}//\%/%%}
      if [ "$VCS_STATUS_LOCAL_BRANCH" = "master" ] ;then
        GIT_PRO="$(set_terminal_fg red)$VCS_STATUS_LOCAL_BRANCH$(set_terminal_fg white)"
      fi
      # with conflicted
      if (( $VCS_STATUS_NUM_CONFLICTED > 0));then
        GIT_PRO="$GIT_PRO $(set_terminal_fg red)$VCS_STATUS_NUM_CONFLICTED$(set_terminal_fg white)"
      fi
      # has commit
      if (( $VCS_STATUS_NUM_STAGED > 0));then
        GIT_PRO="$GIT_PRO +$VCS_STATUS_NUM_STAGED"
      fi
      # need commit
      if (( $VCS_STATUS_NUM_UNSTAGED > 0));then
        GIT_PRO="$GIT_PRO *$VCS_STATUS_NUM_UNSTAGED"
      fi
      # need push
      if (( $VCS_STATUS_COMMITS_AHEAD > 0));then
        GIT_PRO="$GIT_PRO ↑$VCS_STATUS_COMMITS_AHEAD"
      fi
      # need pull
      if (( $VCS_STATUS_COMMITS_BEHIND > 0));then
        GIT_PRO="$GIT_PRO ↓$VCS_STATUS_COMMITS_BEHIND"
      fi
      if (( $VCS_STATUS_NUM_CONFLICTED > 0));then
        prompt_segment purple white  "$GIT_PRO"
      elif (( $VCS_STATUS_NUM_UNSTAGED > 0 || $VCS_STATUS_NUM_STAGED > 0 ));then
        prompt_segment 136 white  "$GIT_PRO"
      else
        prompt_segment green white  "$GIT_PRO"
      fi
    fi
  fi
}

# Dir: current working directory
prompt_dir() {
  local local_path=${PWD:1}
  if [ $MY_SHELL = "zsh" ];then
    prompt_segment blue white ${local_path//'\/'/"$_color_front_set\e[38;5;0m$_color_back_set $_color_front_set\e[38;5;15m$_color_back_set "}
  else
    prompt_segment blue white "$(print -n ${local_path//"/"/" $_color_front_set\e[38;5;0m$_color_back_set$_color_front_set\e[38;5;15m$_color_back_set "})"
  fi
}

prompt_shell(){
  if [ -n $MY_SHELL ];then
    prompt_segment cyan 0 "$MY_SHELL"
  fi
}
# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment blue black "(`basename $virtualenv_path`)"
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_background_jobs() {
  local -a symbols
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols="⚙ $(jobs -l | wc -l)" && prompt_segment_diff maroon cyan "$symbols"
}

prompt_last_command_status(){
  if [[ $RETVAL -ne 0 ]] ;then
    prompt_segment white red "菜"
    prompt_segment red white "$RETVAL"
  fi
}
prompt_show_now_time(){
  prompt_segment blue white "$(date +"%T")"
}

if [ "$(uname -s)" = "Linux" ];then
  for f in $(ls /sys/class/power_supply/);do
    if [ -e /sys/class/power_supply/$f/online ];then
      ACF="/sys/class/power_supply/$f/online"
    fi
  done
elif [ "$(uname -s)" = "Darwin" ];then
fi


prompt_bettery(){
  if [ -d /sys/class/power_supply/BAT0 ];then
    num="$(cat /sys/class/power_supply/BAT0/capacity)"
    STATUS=$num
    if [ $( cat $ACF) -eq "1" ];then
      if [[ $num -ne "100" ]];then
        STATUS=" $STATUS"
      fi
    else
      STATUS="$_color_front_set$(set_terminal_fg red)$_color_back_set $_color_front_set$(set_terminal_fg white)$_color_back_set$STATUS"
    fi
    if [[ $num -lt 10 ]];then
      prompt_segment_diff red white "$STATUS"
    else
      if [[ $num -gt 90 ]];then
        prompt_segment_diff green white "$STATUS"
      else
        prompt_segment_diff olive white "$STATUS"
      fi
    fi
  elif [ "$(uname -s)" = "Darwin" ];then
    STATUS="$(pmset -g ps|grep -o '[0-9]*%')"
    num=${STATUS%%%}
    STATUS="$_color_front_set$(set_terminal_fg red)$_color_back_set $_color_front_set$(set_terminal_fg white)$_color_back_set$STATUS"
    if [[ $num -lt 10 ]];then
      prompt_segment_diff red white "$STATUS\n"
    else
      if [[ $num -gt 90 ]];then
        prompt_segment_diff green white "$STATUS\n"
      else
        prompt_segment_diff olive white "$STATUS\n"
      fi
    fi
  fi

}

prompt_session_check(){
  if [ -f .Session.vim ];then
    prompt_segment green white " "
  fi
  if [ -f .vscode/settings.json ];then
    prompt_segment 17 white " "
  fi
  if [ -f Cargo.toml ];then
    prompt_segment 3 0 " "
  fi
}

prompt_proxy(){
  if [ $http_proxy ];then
    prompt_segment black blue " "
  fi
}


## Main prompt
build_prompt() {
  RETVAL=$?
  echo -ne $_color_reset
  prompt_virtualenv
  prompt_context
  if [ $MY_SHELL != "zsh" ];then
    prompt_shell
  fi
  prompt_dir
  if [ $MY_SHELL = "zsh" ];then
    prompt_git
  fi
  prompt_session_check
  prompt_proxy
  prompt_end
  print -n '\n'
  prompt_show_now_time
  prompt_last_command_status
  prompt_end
  echo -ne $_color_reset
}

build_prompt_diff(){
  echo -ne $_color_reset
  prompt_bettery
  prompt_background_jobs
  echo -ne $_color_reset
}
if [ $MY_SHELL = "zsh" ];then
  PS1='$(build_prompt) > '
  RPROMPT='$(build_prompt_diff)'
else
  PS1='$(echo -ne $(echo -n $(build_prompt))) > '
fi

echo -e "$(echo $_color_reset)\e[1m$(set_terminal_fg blue)[$(set_terminal_fg green)$(date -u +"%F") $(set_terminal_fg blue): $(set_terminal_fg green)$(date -u +"%T")$(set_terminal_fg blue)]$_color_reset" | sed 's/%{//g' | sed 's/%}//g'
