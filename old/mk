#!/bin/sh
#
# mk - build a project
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING for copyright information.

com=

# prefer samurai, it's a bit faster
samu="samu"
command -v "$samu" 2>/dev/null >&2 || \
    samu="ninja"

# GNU Make
[ -f makefile ] && com="make"
[ -f Makefile ] && com="make"

# Meson
[ -f meson.build ] && com="$samu -C build"

# CMake
if [ -f CMakeLists.txt ]
then
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_UNITY_BUILD=True \
        -GNinja || \
        exit 1
    com="$samu"
fi

# Rust
[ -f Cargo.toml ] && \
    com="cargo build --release -j$(nproc)"

$com $@
