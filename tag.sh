#!/bin/bash

for filename in ./*\.mp3; do

	echo "${filename}"
	echo "${filename}" | awk '{printf "Track number: %d", substr($1, 3)}  {printf "\n"}'
	echo "${filename}" | awk '{printf "Titel: " }{i = 3} {while (i + 1 <= NF ) {printf "%s ", $i; i++}} {printf "%s\n", substr($i, 0, length($i) - 4)}'
done
