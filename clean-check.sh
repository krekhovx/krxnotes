#!/bin/sh
#
# Scan project for unwanted text patterns.
#

grep -RIl "^--- " . | xargs awk '
/^--- / {
    if (getline nextLine && nextLine == "")
        print FILENAME ": " $0
}'

echo

grep --binary-files=without-match -rE "—|–|‑|«|»" --color
