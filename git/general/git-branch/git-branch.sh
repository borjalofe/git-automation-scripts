#!/bin/bash

usage="git-branch 1.0.0
Usage: git-branch [{-b | --build | -c | --chore | -i | --ci | -d | --docs | -f | --feature | -x | --fix | -p | --performance | -r | --refactor | -e | --revert | -s | --style | -t | --test} [<issue>] <name>]
                      [{-h | --help}]

git-branch is a script to generate correctly a new branch in the current repo

where:
	-b, --build <issue> <name>    creates a new branch to add a build
	-c, --chore <issue> <name>    creates a new branch to do general tasks
	-i, --ci <issue> <name>       creates a new branch to crud CI
	-d, --docs <issue> <name>     creates a new branch to crud documentation
	-f, --feat <issue> <name>     creates a new branch to crud a feature
	-x, --fix <issue> <name>      creates a new branch to fix code
	-p, --perf <issue> <name>     creates a new branch to improve performance
	-r, --refactor <issue> <name> creates a new branch to refactor code
	-e, --revert <issue> <name>   creates a new branch to revert a previous merge
	-s, --style <issue> <name>    creates a new branch to apply code styling standards
	-t, --test <issue> <name>     creates a new branch to crud tests
	-h, --help                    shows this help text
"

IS_GIT_FOLDER=$(git status | grep branch | wc -l)

if [ $IS_GIT_FOLDER -eq 0 ]; then
	echo "You cannot execute this command in a non-git folder structure."
	echo "${usage}"
	exit 1
fi

BRANCH_TYPE="";
ICON="";
ISSUE="";
NAME="";

POSITIONAL=()

while [[ $# -gt 0 ]]; do
	key=$1
	case "$key" in
		-b | --build )
			BRANCH_TYPE="build";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="🚀";
			;;
		-c | --chore )
			BRANCH_TYPE="chore";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			;;
		-i | --ci )
			BRANCH_TYPE="ci";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="👷";
			;;
		-d | --docs )
			BRANCH_TYPE="docs";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="📝";
			;;
		-f | --feat )
			BRANCH_TYPE="feat";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="✨";
			;;
		-x | --fix )
			BRANCH_TYPE="fix";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="🐛";
			;;
		-p | --perf )
			BRANCH_TYPE="perf";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="⚡";
			;;
		-r | --refactor )
			BRANCH_TYPE="refactor";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="♻";
			;;
		-e | --revert )
			BRANCH_TYPE="revert";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="⏪";
			;;
		-s | --style )
			BRANCH_TYPE="style";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="🎨";
			;;
		-t | --test )
			BRANCH_TYPE="test";
			shift ;
			if [ $# -gt 1 ]; then
				ISSUE=$1;
				shift ;
				NAME=$1;
				shift ;
			elif [ $# -gt 0 ]; then
				NAME=$1;
				shift ;
			fi
			ICON="✅";
			;;
		-h | --help )
			echo "${usage}" ;
			exit 0 ;;
		-- )
			shift ;
			break ;;
		* )
			POSITIONAL+=("$1")
			shift ;;
	esac
done

set -- "${POSITIONAL[@]}"

if [[ ${NAME} == "" ]]; then
	read -p "Please, provide a name for the new branch: " NAME
	if [[ ${ISSUE} == "" ]]; then
		read -p "Do your branch have a related issue? (y)es (n)o " HAS_RELATED_ISSUE
		if [[ ${HAS_RELATED_ISSUE} == "y" ]]; then
			read -p "What's the related issue number?" ISSUE
		fi
	fi
fi

NAME=${NAME,,}
NAME=$(echo "$NAME" | iconv -c -f utf-8 -t ascii//TRANSLIT)
NAME=${NAME// /-}

if [[ $ICON != "" ]]; then
        NAME="${ICON}-${NAME}"
fi

if [[ $ISSUE != "" ]]; then
	ISSUE=${ISSUE,,}
	ISSUE=${ISSUE// /-}
        NAME="${ISSUE}-${NAME}"
fi

NAME="${BRANCH_TYPE}/${NAME}"

git checkout develop && git pull origin develop && git checkout -b "${NAME}" && git push origin "${NAME}"
