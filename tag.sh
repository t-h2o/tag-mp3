#!/bin/bash

for filename in ./*\.mp3; do

	track=$(echo "${filename}" | awk '{printf "%d", substr($1, 3)}')
	title=$(echo "${filename}" | awk '{i = 3} {while (i + 1 <= NF ) {printf "%s ", $i; i++}} {printf "%s", substr($i, 0, length($i) - 4)}')
	printf "Track: %s\tTitle: %s\n" "${track}" "${title}"
done
