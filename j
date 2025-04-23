#!/bin/sh
#
# j - Java stuff.
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.

. $(which std)

JUNIT="/home/kiedtl/.local/lib/java/junit-platform-console-standalone.jar"

name=${2%%.java}

[ -f $JUNIT ] || die "Can't find jUnit"

case "$1" in
    c) javac -cp .:$JUNIT ${name}.java ;;
    r)
        javac -cp .:$JUNIT ${name}.java || die "Compilation failed."
        shift 2
        java -ea $name "$@"
    ;;
    t)
        javac -cp .:$JUNIT ${name}.java || die "Compilation failed."
        java -jar $JUNIT -cp . --select-class ${name}Test
    ;;
esac
