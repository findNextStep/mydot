#! /usr/bin/env python3
# -*- coding: utf-8 -*-
import subprocess

from libqtile import bar, extension, hook, layout, widget
from libqtile.command import lazy
from libqtile.config import Click, Drag, Group, Key, Screen
from pymouse import PyMouse

import os

shift = 'shift'
control = 'control'
alt_l = 'mod1'
alt_r = 'mod3'
super_l = 'mod4'
super_r = 'mod5'
mod = alt_r


layouts=[
    layout.Columns(split=False),
    #  layout.MonadTall(),
    #  layout.tree.TreeTab(),
    layout.MonadWide(min_secondary_size = 10,min_ratio= 0.1,max_ratio=0.9),
    #  layout.bsp.Bsp(),
    layout.Max(),
]

##
# @brief toggle_layout 更改布局
#
# @param qtile this
#
# @return null
def toggle_layout(qtile):
    if cmp(qtile.currentLayout.info()['name'], layouts[0].name) == 0:
        qtile.currentGroup.toLayoutIndex(1)
    else:
        qtile.currentGroup.toLayoutIndex(0)
    return

def front_if_not_fullscreen(qtile):
    pass
#  for win in qtile.currentGroup.window:
    #  if win.float:
        #  win.cmd_bring_to_front()
        #  if win.fullscreen:
            #  win.window.configure(stackmode=StackMode.Below)
last_window_id = ''
def focus_transset(w):
    os.system("transset -i " + str(w.window.wid) + ' 1')
    global last_window_id
    if last_window_id is not w.window.wid:
        if last_window_id is not '':
            os.system("transset -i " + str(last_window_id) + ' 0.75')
    last_window_id = w.window.wid


keys = [
    Key([mod], "h", lazy.layout.left(),
        lazy.function(lambda x:focus_transset(x.currentWindow))),
    Key([mod], "l", lazy.layout.right(),
        lazy.function(lambda x:focus_transset(x.currentWindow))),
    Key([mod], "j", lazy.group.next_window(),
        lazy.function(lambda x:focus_transset(x.currentWindow))),
    Key([mod], "k", lazy.group.prev_window(),
        lazy.function(lambda x:focus_transset(x.currentWindow))),
    Key([mod, shift], "h", lazy.layout.swap_left(),
        lazy.layout.shuffle_left()),
    Key([mod, shift], "l", lazy.layout.swap_right(),
        lazy.layout.shuffle_right()),
    Key([mod, shift], "j", lazy.layout.shuffle_down()),
    Key([mod, shift], "k", lazy.layout.shuffle_up()),
    Key([mod, control], "j", lazy.layout.grow(),lazy.layout.grow_down()),
    Key([mod, control], "k", lazy.layout.shrink(),lazy.layout.grow_up()),
    Key([mod, control], "h", lazy.layout.grow_left()),
    Key([mod, control], "l", lazy.layout.grow_right()),
    Key([super_l, alt_l], "j", lazy.layout.grow(),lazy.layout.shuffle_down()),
    Key([super_l, alt_l], "k", lazy.layout.shrink(),lazy.layout.shuffle_up()),
    Key([super_l, alt_l], "h", lazy.layout.shuffle_left()),
    Key([super_l, alt_l], "l", lazy.layout.shuffle_right()),
    Key([mod, control], "n", lazy.layout.normalize()),
    Key([mod, control], "o", lazy.layout.maximize()),
    Key([mod, control], "space", lazy.layout.flip()),
    Key([alt_l], "Tab", lazy.group.next_window(),
        lazy.function(lambda x:focus_transset(x.currentWindow))),
    Key([mod], 'c', lazy.window.kill(),
        lazy.group.next_window(),
        lazy.function(lambda x:focus_transset(x.currentWindow))),
    Key([mod, super_l], 'r', lazy.restart()),
    Key([mod], "space", lazy.function(toggle_layout)),
    Key([mod,shift],'space',lazy.group.setlayout(layouts[2].name)),
    Key([mod], 't', lazy.window.toggle_floating(),
        lazy.function(lambda x:front_if_not_fullscreen(x))),
    Key([mod],'F12',lazy.window.toggle_fullscreen()),
    Key([mod],'n',lazy.hide_show_bar('bottom')),
]

keys.extend([
    Key([mod,shift],'q',lazy.shutdown()),
    Key([mod,shift],'r',lazy.restart()),
])

def open_web(url):
    return lazy.spawn("google-chrome " + url)

m = PyMouse()
def mouse_move(x_move,y_move):
    (x,y) = m.position()
    m.move(x+x_move,y+y_move)

def mouse_click(click_num = 1):
    (x,y) = m.position()
    m.click(x,y,click_num)

keys.extend([
    # mouse control
    Key([mod,alt_l,shift],'h',lazy.function(lambda _:mouse_move(-20,0))),
    Key([mod,alt_l,shift],'j',lazy.function(lambda _:mouse_move(0,20))),
    Key([mod,alt_l,shift],'k',lazy.function(lambda _:mouse_move(0,-20))),
    Key([mod,alt_l,shift],'l',lazy.function(lambda _:mouse_move(20,0))),
    Key([mod,alt_l],'h',lazy.function(lambda _:mouse_move(-1,0))),
    Key([mod,alt_l],'j',lazy.function(lambda _:mouse_move(0,1))),
    Key([mod,alt_l],'k',lazy.function(lambda _:mouse_move(0,-1))),
    Key([mod,alt_l],'l',lazy.function(lambda _:mouse_move(1,0))),
    Key([mod,alt_l],'f',lazy.function(lambda _:mouse_click(1)),
        lazy.function(lambda x:focus_transset(x.currentWindow))),
    # apps
    Key([super_l],'j',lazy.spawn("dmenu_run -p \">\" -nb \"#000000\" -sb \"#666666\" -b")),
    Key([super_l],'d',open_web('')),
    Key([super_l],'f',lazy.spawn('nemo')),
    Key([super_l],'z',open_web('www.zhihu.com')),
    Key([super_l],'b',open_web('t.bilibili.com')),
    Key([super_l],'Return',lazy.spawn('sakura')),
    Key([control,alt_l],'a',lazy.spawn('shutter -s -n -c')),
    Key([super_l],'l',lazy.spawn('dm-tool lock'),
        lazy.spawn('gnome-screensaver-command --lock')),

    Key([shift], "XF86AudioRaiseVolume",
        lazy.spawn('pactl set-sink-volume 0 +10%')),
    Key([shift], "XF86AudioLowerVolume",
        lazy.spawn('pactl set-sink-volume 0 -10%')),
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn('pactl set-sink-volume 0 +5%')),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn('pactl set-sink-volume 0 -5%')),
    Key([], "XF86AudioMute",
        lazy.spawn('pactl set-sink-volume 0 0')),
])

mouse = (
    Drag([super_l], 'Button1', lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([super_l], 'Button3', lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
)

bring_front_click = True
cursor_warp = False
follow_mouse_focus = False
dgroups_key_binder = None
auto_fullscreen = False

widget_defaults = dict(
    font='DroidSansMono Nerd Font',
    fontsize=15,
)

dgroups_app_rules = []

group_name='asdfuiop'
groups=[]
for name in group_name:
    groups.append(Group(name))
    keys.append(Key([mod], name,
                    lazy.group[name].toscreen(),
                    lazy.function(lambda x:focus_transset(x.currentWindow))))
    keys.append(Key([mod, shift], name,
                    lazy.window.togroup(name),
                    lazy.function(lambda x:focus_transset(x.currentWindow))))

    floating_layout = layout.Floating()

##
# @brief count_screen 计算我链接了几个屏幕
#
# @return 链接屏幕的数量
def count_screen():
    (st,_) = subprocess.Popen(['xrandr','-q'],stdout=subprocess.PIPE,shell=True).communicate()
    return len(filter(lambda x:" connected" in x,st.split('\n')))

screens = [
    Screen(
        bottom=bar.Bar(
            widgets=[
                widget.AGroupBox(),
                widget.GroupBox(
                    highlight_method='block',
                    inactive='999999'
                ),
                widget.currentlayout.CurrentLayout(),
                widget.currentlayout.CurrentLayoutIcon(scale=0.5),
                widget.currentscreen.CurrentScreen(),
                widget.Prompt(),
                widget.WindowName(),
                widget.TextBox('\\ufa7d'.decode('unicode-escape')),
                widget.volume.Volume(),
                widget.TextBox('\\uf578'.decode('unicode-escape')),
                widget.battery.Battery(),
                widget.TextBox('\\uf0eb'.decode('unicode-escape')),
                widget.backlight.Backlight(backlight_name='intel_backlight'),
                #  widget.wlan.Wlan(),
                widget.Clock(format='%Y-%m-%e %H:%M:%S'),
                widget.Systray(),
            ],
            size=30,
            background=['000000'],
        ),
    ),
]

screen_name = 'qwer'
for i in range(0,count_screen()):
    keys.append(Key([mod],screen_name[i],lazy.to_screen(i),
        lazy.function(lambda x:focus_transset(x.currentWindow))))
    if i!=0:
        screens.append(
            Screen(
                bottom=bar.Bar(
                    widgets=[
                        widget.AGroupBox(),
                        widget.currentlayout.CurrentLayout(),
                        widget.currentlayout.CurrentLayoutIcon(scale=0.5),
                        widget.currentscreen.CurrentScreen(),
                        widget.Prompt(),
                        widget.WindowName(),
                        widget.Clock(format='%Y-%m-%e %H:%M:%S'),
                    ],
                    size=30,
                    background=['000000'],
                ),
            )
        )

@hook.subscribe.client_new
def func(c):
    focus_transset(c)
    if c.match(wmclass='tim.exe'):
        c.togroup('p')
    elif c.match(wmclass='netease-cloud-music'):
        c.togroup('o')

def main(qtile):
    pass
