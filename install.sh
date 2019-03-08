git submodule update --init --recursive

mkdir -p ~/.config/sakura/

cd oh-my-zsh
git submodule update
cd ..

$(pwd)/dotsync/bin/dotsync -f $(pwd)/.dotsyncrc -L

cp ./picture/background.jpg ~/.xmonad/

rm ~/Music

ln jianguo_sync/netease_cloud_music ~/Music -s
