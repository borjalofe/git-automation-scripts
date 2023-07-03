#!/bin/bash

usage="git-pmr-description 1.0.0
Usage: git-pmr-description [{-h | --help}]

git-pmr-description is a script to generate correctly a new pull / merge request's description

where:
	-h, --help                    shows this help text
"

IS_GIT_FOLDER=$(git status | grep branch | wc -l)

if [ $IS_GIT_FOLDER -eq 0 ]
then
	echo "You cannot execute this command in a non-git folder structure."
	echo "${usage}"
	exit 1
fi

TITLE=$(git symbolic-ref --short HEAD | sed "s/-/ /g" | sed "s/\// \/ /g" | sed "s/\b\(.\)/\u\1/g" | sed "s/devcp /DEVCP-/gi")

TASKS=""

for commit in $(git log origin/develop..HEAD --pretty=format:"%h" --reverse)
do
	SUBJECT=$(git log -1 --pretty=format:"%s" $commit)
	DESCRIPTION=$(git log -1 --pretty=format:"%b" $commit)

	TASKS="${TASKS}\n\n1. ${SUBJECT}"
	if [[ ! -z "$b" ]]
	then
		TASKS="${TASKS}\n\n   ${DESCRIPTION}"
	fi
done

echo -e "# ${TITLE}\n\n## Tasks${TASKS}"
