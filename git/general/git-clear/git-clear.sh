#!/bin/bash

BRANCHES_TO_DELETE=$(git branch | grep -v develop | grep -v master | grep -v main | grep -v release)

if [ -z "$BRANCHES_TO_DELETE" ]
then
    echo "No branches to delete"
    exit 0
fi

echo "You have currently $(echo $BRANCHES_TO_DELETE | wc -l) branches to delete: $BRANCHES_TO_DELETE"
read -p "Are you sure you want to delete them? (y/n) " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Deleting branches..."
    for BRANCH in $BRANCHES_TO_DELETE
    do
        git branch -D $BRANCH
    done
fi