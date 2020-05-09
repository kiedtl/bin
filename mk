#!/bin/sh
#
# mk - build a project
# (c) Kiëd Llaentenn <kiedtl@protonmail.com>
# See the COPYING for copyright information.

com=

[ -f makefile ] && com="make"
[ -f Makefile ] && com="make"

if [ -f meson.build ]
then
    if command -v samu 2>/dev/null >&2
    then
        com="samu -C build"
    else
        com="ninja -C build"
    fi
fi

$com $@
