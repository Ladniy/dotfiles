#!/usr/bin/env bash

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && (wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED && echo 0 > $XDG_RUNTIME_DIR/wob.sock) || wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | sed 's/[^0-9]//g' > $XDG_RUNTIME_DIR/wob.sock
