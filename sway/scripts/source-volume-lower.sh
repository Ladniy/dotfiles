#!/usr/bin/env bash

(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED && echo 0 > $XDG_RUNTIME_DIR/wob.sock) || (wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 0.1- && wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | sed 's/[^0-9]//g' > $XDG_RUNTIME_DIR/wob.sock)
