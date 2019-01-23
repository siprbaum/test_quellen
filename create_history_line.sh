#!/bin/bash
#
# Create a line of 10 commits all in one branch named history
#

old_head=$(git rev-parse --short HEAD)

git branch -D history 2>/dev/null || true
git checkout -b history ${old_head}

for i in $(seq -w 1 10); do
	echo $i > $i
	git add $i
	git commit -m "Added $i"
done
