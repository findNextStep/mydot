#!/bin/bash

xinput --list | grep Touch > /dev/null || exit 1

id=$(xinput --list | grep Touch | awk -F"=" '{print $2}' | awk '{print $1}');

touch_enable_id=$(xinput list-props $id | grep "libinput Tapping Enabled (" | grep -P '\(\d+\)' -o | grep -P '\d+' -o)

xinput set-prop $id $touch_enable_id 1

scrolling_id=$(xinput list-props $id | grep "Natural Scrolling Enabled (" | grep -P '\(\d+\)' -o | grep -P '\d+' -o)

xinput set-prop $id $scrolling_id 1
