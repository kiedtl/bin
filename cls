#!/bin/sh
#
# cls - cat for file, ls for dir. 
# (c) Kied Llaentenn (@kiedtl)
# See the LICENSE for more information.

main() {
	ARGS=${@:-$(pwd)} 
	[ -d "$ARGS" ] &&
		ls $ARGS --color
	[ -f "$1" ] &&
		cat $ARGS
}

main "$@"

