#!/usr/bin/env bash 
set -e
set -o pipefail
SCRIPTPATH=$(realpath "$(dirname "$0")")

export ROFI_RETV
if [[ "$#" -lt 2 ]]
then
   "$SCRIPTPATH/mimeapps" "$1"
else
   coproc ( "$SCRIPTPATH/mimeapps" "$1" "$2" > /dev/null 2>&1 )
fi
