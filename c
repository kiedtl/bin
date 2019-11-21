#!/bin/sh
#
# c - cat, cd, and clear into one unified script
# (c) Kied Llaentenn (@kiedtl)
# See the LICENSE for more information.
#
# Note: this is not a script. it must be sourced to work.

c() {
	[ -f "$1" ] && {
		case "$1" in
			*.txt) cat "$1";;
			*.rs|
				*.md|
				*.sh|
				*.c|
				*.cpp) bat "$1";;
			*) cat "$1";
		esac;
	}
	[ -d "$1" ] && {
		cd "$1"
	}
	[ -z "$1" ] && { clear; }

	#printf "\033[1mERROR: \033[0m%s\n" "Invalid arguments."
}
