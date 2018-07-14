git submodule update --init --recursive

mkdir -p ~/.config/sakura/

$(pwd)/dotsync/bin/dotsync -f $(pwd)/.dotsyncrc -L

cd oh-my-zsh
git submodule update