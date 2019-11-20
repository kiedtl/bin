#!/bin/sh
#
# c - cat, cd, and clear into one unified script
# (c) Kied Llaentenn (@kiedtl)
# See the LICENSE for more information.
#
# Note: this is not a script. it must be sourced to work.

c() {
	[ -f "$1" ] && { cat "$1"; exit; }
	[ -d "$1" ] && {
		export PWD="$1"
		exit
	}
	[ -z "$1" ] && { clear; exit; }
	printf "\033[1mERROR:\033[0m%s\n" "Invalid arguments."
}
