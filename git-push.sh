#!/bin/bash
cur="$(pwd)"
git push --set-upstream origin $(git branch | grep \* | cut -d ' ' -f2-)

for module in $(cat .gitmodules | grep path | sed  's/path = //g' | xargs echo)
do
  cd "${cur}/${module}"
  git push --set-upstream origin $(git branch | grep \* | cut -d ' ' -f2-)
done
