#!/bin/bash
git submodule update --init --recursive

mkdir -p ~/.config/sakura/

cd oh-my-zsh
git submodule update
cd ..
meOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
        $(pwd)/dotsync/bin/dotsync -f $(pwd)/.dotsyncrc -L
    Darwin*)   
        $(pwd)/dotsync/bin/dotsync -f $(pwd)/.dotsyncrc_for_mac -L
esac


ln jianguo_sync/netease_cloud_music ~/Music -s
