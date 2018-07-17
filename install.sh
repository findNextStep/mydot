git submodule update --init --recursive

_installTim(){
    if [ ! -e bin/tim ] ; then
    sudo apt install curl
    curl https://yun.tzmm.com.cn/index.php/s/5hJNzt2VR9aIEF2/download > bin/tim
    fi
}
# 后台下载可用的tim.appimg
_installTim &

mkdir -p ~/.config/sakura/

$(pwd)/dotsync/bin/dotsync -f $(pwd)/.dotsyncrc -L

cd oh-my-zsh
git submodule update