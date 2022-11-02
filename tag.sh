#!/bin/bash

# For each folder begin with Bob
for folder in ./Bob*; do

	# Remove "./"
	folder=$(basename "${folder}")
	artist="Bob Marley"

	# Parse year and album name
	year=$(echo "${folder}" | awk '{printf "%d", $4}')
	album=$(echo "${folder}" | awk '{i = 6} {while (i <= NF ) {printf "%s ", $i; i++}}')

	# For each file in the album
	for filepath in "${folder}"/*\.mp3; do

		# Remove the path name
		filename=$(basename "${filepath}")

		# Parse the track and the title
		track=$(echo "${filename}" | awk '{printf "%d", $1}')
		title=$(echo "${filename}" | awk '{i = 3} {while (i + 1 <= NF ) {printf "%s ", $i; i++}} {printf "%s", substr($i, 0, length($i) - 4)}')

		# Tag track
		mp3info -a "${artist}" -l "${album}" -y "${year}" -t "${title}" -n "${track}" "${filepath}"
		echo mp3info -a "${artist}" -l "${album}" -y "${year}" -t "${title}" -n "${track}" "${filepath}"
	done
done
