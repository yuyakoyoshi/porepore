#!/bin/bash

branches=`git branch | grep -v main`

git checkout main

for branch in $branches

do
  git branch -D $branch
done