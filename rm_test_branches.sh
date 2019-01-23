#!/bin/bash
old_head=$(git symbolic-ref --short HEAD 2>/dev/null|| git rev-parse HEAD)
git checkout HEAD^{commit}

for i in $(seq -w 1 10); do
	git branch -D branch_$i
done

git checkout $old_head
