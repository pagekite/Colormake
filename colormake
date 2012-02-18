#!/bin/bash
#
# Wrapper around make, to colorize it's output and pipe through less.
# Jumps to the first gcc error that occurs during the build process.
#
# Run with --fit as the first argument to shorten each line so it fits
# on the screen.
#

if [ "$1" = "--fit" ]; then
    # Fix suggested by Mr. Magne
    SIZE=$(stty size)
    shift
else
    SIZE=""
fi

if [ "$TERM" = "dumb" ];then
   # As suggested by Alexander Korkov ...
   exec make "$@"
fi

make "$@" 2>&1 | colormake.pl $SIZE

# Thanks to Alexander Korkov and Kolan Sh
exit ${PIPESTATUS[0]}
