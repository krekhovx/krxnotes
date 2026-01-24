#!/bin/sh
#
# Show all topics from all *.txt files
#

find . -type f -name "*.txt" -not -empty | while IFS= read -r f; do
	if grep 'Темы:' "$f" >/dev/null; then
		echo
		echo "Файл: $f"
		echo "Темы:"
		awk '
		  /Темы:/ {print_flag=1; next}
		  print_flag && /^\*/ {print; next}
		  print_flag {print_flag=0}
		' "$f"
	fi
done
