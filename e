#!/bin/sh
#
# e [iters] [scale] - calculate e
# (c) Kiëd Llaentenn <kiedtl@tilde.team>
# See the COPYING file for copyright information.
#
# this uses the following infinite series formula:
#
#         inf
#         ___  1
# e = 1 + \   ───
#         /__ +n!
#         n=0

echo "
define fac(n) {
    if (n == 1) {
        return 1;
    }

    return n * fac(n - 1)
}

define calc_e(iters, accm) {
    if (iters == 0) {
        return accm
    }

    return calc_e(iters - 1, accm + 1/(fac(iters)))
}

scale=${2:-10}
1 + calc_e(${1:-10}, 0)
" | bc -ql
