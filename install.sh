#!/bin/bash
git submodule update --init --recursive

mkdir -p ~/.config/sakura/

case "$(uname -s)" in
    Linux*)
        $(pwd)/dotsync/bin/dotsync -f $(pwd)/.dotsyncrc -L ;;
    Darwin*)   
        defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
        $(pwd)/dotsync/bin/dotsync -f $(pwd)/.dotsyncrc_for_mac -L ;;
esac


ln ~/jianguo_sync/netease_cloud_music ~/Music -s
