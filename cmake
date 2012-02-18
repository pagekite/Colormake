#!/bin/bash
#
# Wrapper around make, to colorize it's output and pipe through less.
# Jumps to the first gcc error that occurs during the build process.
#

if [ "$TERM" = "dumb" ];then
   # As suggested by Alexander Korkov ...
   exec make "$@"
fi

# Fix suggested by Mr. Magne
SIZE=$(stty size)
make "$@" 2>&1 | colormake.pl $SIZE

# Thanks to Alexander Korkov and Kolan Sh
exit ${PIPESTATUS[0]}
