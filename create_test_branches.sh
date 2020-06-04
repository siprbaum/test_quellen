#!/bin/bash
#
# Create several distinct test branches named
# like branch_X (x is a number from 1 to 10)
#

old_head=$(git rev-parse --short HEAD)

for i in $(seq -w 1 10); do
	git checkout -b branch_$i ${old_head}
	echo $i > $i
	git add $i
	git commit -m "Added $i"
done
