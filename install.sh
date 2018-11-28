git submodule update --init --recursive

mkdir -p ~/.config/sakura/

cd oh-my-zsh
git submodule update
cd ..

$(pwd)/dotsync/bin/dotsync -f $(pwd)/.dotsyncrc -L
