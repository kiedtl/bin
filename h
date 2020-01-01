#!/bin/sh
#
# h - cd to home directory.
# NOTE: this is not a script, it is a function
# and must be sourced in shell profile.

h() {
	echo -en "\033]0;${HOME}\007"
	cd "${HOME}"
}
