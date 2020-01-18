#!/bin/bash

name_of_branch="$1"
cur="$(pwd)"

git checkout -b "${name_of_branch}"

for module in $(cat .gitmodules | grep path | sed  's/path = //g' | xargs echo)
do
  cd "${cur}/${module}"
  git checkout -b ${name_of_branch}
done
