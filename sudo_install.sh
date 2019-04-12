#!/bin/sh

# 下面这两个文件使得在电脑锁定唤醒之后耳机仍然能够正常工作
# 如果没有自动生效,请在sudo下使用~/bin/init-headphone
# install_ln sudo_need/init-headphone_in_sleep.d /etc/pm/sleep.d/init-headphone
# this work for me
cp sudo_need/init-headphone_in_sleep.d /lib/systemd/system-sleep/init-headphone

cp sudo_need/privoxy_config /etc/privoxy/config

cp bin/init-headphone /usr/local/sbin/init-headphone

# 更换grub背景
convert picture/background.jpg picture/background.png
cp ./sudo_need/grub /etc/default/grub
update-grub

# 更改电源设置
cp ./sudo_need/logind.conf /ect/systemd/logind.conf
sudo systemctl restart systemd-logind.service
