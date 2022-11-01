#!/bin/bash

pattern="Fan: (.+) rpm CPU die temperature: (.+) C"
if [[ "Fan: fann rpm CPU die temperature: 42 C" =~ $pattern ]]; then
    fan=${BASH_REMATCH[1]}
    cpu=${BASH_REMATCH[2]}
fi
echo "$fan" "$cpu"

for filename in ./*; do
	echo "${filename}"
done
