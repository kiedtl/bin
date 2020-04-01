#!/bin/sh
#
# w - change wallpaper
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the LICENSE for copyright information.

[ -d "~/img/wallpapers" ] && \
    git clone git@github.com:kiedtl/walls ~/img/wallpapers

command -v wal 2>/dev/null >&2 || exit 1

wal -i ~/img/wallpapers/${1:-}

pkill lbar     || :
pkill lemonbar || :

lbar &
