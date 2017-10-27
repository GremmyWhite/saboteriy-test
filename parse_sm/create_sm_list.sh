#!/usr/bin/env bash

echo -e "Usage: create_sm_list.sh [path to songs directory]\n"

if [ -z "$1" ]; then
  echo "No directory given, used default songs/"
  DIRECTORY="songs"
else
  DIRECTORY="$1"
fi

echo "Searching songs in directory [$DIRECTORY]:"
SONGLIST=$(/usr/bin/find "$DIRECTORY" -name "*.sm")


while read FILENAME; do
 TITLE=$(/usr/bin/grep "#TITLE:" "$FILENAME")
 TITLE_CLEAR=$(echo $TITLE | cut -d ":" -f 2)
 BPM=$(/usr/bin/grep BPMS "$FILENAME")
 BPM_CLEAR=$(echo $BPM|cut -d "=" -f 2)
 echo "${TITLE_CLEAR} ${BPM_CLEAR}"
done <<<${SONGLIST}
