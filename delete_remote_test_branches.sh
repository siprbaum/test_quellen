#!/bin/bash

#seq -w 1 10|xargs -i -P 2 git push origin :branch_\{\}

branches=
for i in $(seq -w 1 10); do
	branches="${branches} branch_$i"
done
git push origin -d $branches
