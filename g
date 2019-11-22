#!/bin/sh
#
# g - a git wrapper
# (c) Kied Llaentenn
# see the LICENSE for more information.
# NOTE: this script contains items stol^Htaken from
# http://github.com/mitchweaver/bin.

g_usage() {
	echo "g - a git wrapper
(c) Kied Llaentenn

USAGE:
\tg [action]

ACTIONS:
\t_\tshow usage
\tc\tadd files and commit
\ti\tshow repo information
\ts\tshow repo status
"
}

g_add() {
	for thing in $(nnn -Hp - .); do
		git add $thing
		printf "\t- adding file $(basename $thing)\n"
	done
	printf "\033[1mEnter commit message: \033[0m"
	read -r msg
	git commit -m "${msg}"
}

g_info() {
    printf "\033[1mCommits\n\033[0m"
    git rev-list --count --all
    printf "\n\033[1mContributors\n\033[0m"
    git log --format="%aN"| \
        sort | \
        uniq -c | \
        sort -nr | \
        sed 's|^[ ]*[^ ]*[ ]*||'
}

main() {
	case "$1" in
		'') g_usage ;;
		c*) g_add ;;
		i*) g_info ;;
		s*) git status ;;
		 *) g_usage ;;
	esac
}

main "$@"
