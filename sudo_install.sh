#!/bin/sh
install_ln(){
    if [ -x $(pwd)/$1 -a ! -x $2 ];then
        sudo ln -s $(pwd)/$1 $2
    fi
}



# 下面这两个文件使得在电脑锁定唤醒之后耳机仍然能够正常工作
# 如果没有自动生效,请在sudo下使用~/bin/init-headphone
# install_ln sudo_need/init-headphone_in_sleep.d /etc/pm/sleep.d/init-headphone
# this work for me
install_ln sudo_need/init-headphone_in_sleep.d /lib/systemd/system-sleep/init-headphone

install_ln bin/init-headphone /usr/local/sbin/init-headphone

# 更改电源设置
install_ln ./sudo_need/logind.conf /ect/systemd/logind.conf
sudo systemctl restart systemd-logind.service

