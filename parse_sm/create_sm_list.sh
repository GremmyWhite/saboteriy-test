#!/usr/bin/env bash

echo -e "Usage: create_sm_list.sh [path to songs directory]\n"

# if first argument empty - set default directory
if [ -z "$1" ]; then
  echo "No directory given, used default songs/"
  DIRECTORY="songs"
else
# else set directory equal to argument 1
  DIRECTORY="$1"
fi

echo "Searching songs in directory [$DIRECTORY]:"
# use find command to fine all *.sm files in given directory and put them to array SONGLIST
SONGLIST=$(/usr/bin/find "$DIRECTORY" -name "*.sm")

# loop by array that redirected to the while do..done loop
while read FILENAME; do
# using grep to find a line with pattern
 TITLE=$(/usr/bin/grep "#TITLE:" "$FILENAME")
# using cut to get the second column divided by ":"
 TITLE_CLEAR=$(echo $TITLE | cut -d ":" -f 2)
 BPM=$(/usr/bin/grep BPMS "$FILENAME")
 BPM_CLEAR=$(echo $BPM|cut -d "=" -f 2)
 echo "${TITLE_CLEAR} ${BPM_CLEAR}"
done <<<${SONGLIST}
