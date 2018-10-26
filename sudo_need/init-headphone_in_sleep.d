#!/bin/sh
# can be found in https://superuser.com/questions/1047666/headphone-jack-stops-working-after-suspend-reboot

modprobe i2c_dev
modprobe i2c_i801

if [ ! -x /usr/local/sbin/init-headphone ]; then
    exit 0
else
    /usr/local/sbin/init-headphone
fi

case $1 in
     resume|thaw)
        /usr/local/sbin/init-headphone
       ;;
esac
