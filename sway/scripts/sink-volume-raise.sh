#!/usr/bin/env bash

(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo 0 > $XDG_RUNTIME_DIR/wob.sock) || (wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ && wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g' > $XDG_RUNTIME_DIR/wob.sock)
