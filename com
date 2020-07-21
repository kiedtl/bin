#!/bin/sh
#
# com - communism
# (c) Kiëd Llaentenn
# See the copyright file for more details
#
# Kiëd Llaentenn disclaims any implied
# connection to Communism

printf '\x038,5 ☭ %s ☭ \x0f' "$(echo "$1" | tr [[:lower:]] [[:upper:]])"
