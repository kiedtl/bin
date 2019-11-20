#!/bin/sh
#
# v - open file in editor. 
# (c) Kied Llaentenn (@kiedtl)
# See the LICENSE for more information.

main() {
	[ -f "$1" ] && {
		vim "$1";
	}
}

main "$@"

