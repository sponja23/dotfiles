#!/usr/bin/env bash

unclutter &
dunst &
eww daemon &
greenclip daemon &

systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --systemd --all
dbus-launch --exit-with-session ~/.local/bin/xmonad
