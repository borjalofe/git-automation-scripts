# Git Branch Generator Script

This script is designed to streamline the creation of new branches in your Git repository, with several options to categorize the purpose of the branch.

## Table of Contents

- [Git Branch Generator Script](#git-branch-generator-script)
  - [Table of Contents](#table-of-contents)
  - [Intro](#intro)
  - [Technologies](#technologies)
  - [How to use it](#how-to-use-it)
    - [Help](#help)
    - [Examples](#examples)
  - [Features](#features)
  - [ToDo](#todo)
  - [Status](#status)
  - [Contact](#contact)

## Intro

Whenever we're working in a project using Git, it's necessary to create different branches for different purposes such as fixing bugs, adding features, etc. Manually creating these branches and ensuring their names follow a standard convention can be time-consuming. This script aims to automate this process.

## Technologies

The Git Branch Generator script is created with:

- [Git](https://git-scm.com/): To get the current user, the current repo, the current branch, the commits made in the branch, and the commit messages.

- [Bash](https://www.gnu.org/software/bash/): To run the script.

And we use the [Conventional Commits Standard](https://www.conventionalcommits.org/en/v1.0.0/) to categorize the branches -I know, I know... branches are not commits but I think the standard is good enough if you call the branch as the main task you want to address, which will have its own commit-.

## How to use it

Firstly, you need to clone the repository that contains the script:

```bash
git clone git@github.com:borjalofe/git-automation-scripts.git
cd git-automation-scripts
chmod +x ./general/git-branch/git-branch.sh
```

I suggest you to add the script to your cli setup -in the example I'll use bash-, so you can run it from anywhere. To do so, you can add the following line to your `.bash_aliases` file:

```bash
alias git-branch="path/to/git-automation-scripts/general/git-branch/git-branch.sh"
```

Then, you can run `git-branch` in your terminal within your Git repository folder structure with various options:

```bash
git-branch 1.0.0
Usage: git-branch [{-b | --build | -c | --chore | -i | --ci | -d | --docs | -f | --feat | -x | --fix | -p | --perf | -r | --refactor | -e | --revert | -s | --style | -t | --test} [<issue>] <name>]
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
```

### Help

For help on how to use this script, you can run:

```Bash
git-branch -h
```

or

```bash
git-branch --help
```

These commands will display a help message that describes how to use the script.

### Examples

To create a branch for adding a new feature, you just need to write:

```bash
git-branch -f ISSUE_NAME BRANCH_NAME
```

or

```bash
git-branch --feat ISSUE_NAME BRANCH_NAME
```

## Features

- The script will automatically detect if the current folder is part of a Git repository. If not, it will show an error message and exit.

- Automated branch creation with type specification

- Branch naming following a standard convention

- Issue linking capability

- Variety of branch types to choose from

- Emoji icons for branch types

## ToDo

- **Improve error handling:** Provide more detailed feedback for the user.

- **Integrate with issue tracking systems:** Link with systems such as JIRA or GitHub Issues for automatic issue tracking.

- **Add configuration file:** Allow users to customize branch naming conventions.

- **Allow branch creation from other branches:** Enable users to create branches from branches other than the `develop` branch.

- **Implement user confirmation:** Ask for user confirmation before creating the new branch.

- **Add more branch types:** Create additional branch types based on user feedback and project needs.

- **Add multi-issue branch creation functionality:** Develop an option to generate branches for multiple issues at once.

- **Add sub-task handling functionality:** Add capability to manage sub-tasks within an issue.

- **Add branch duplication check functionality:** Implement a feature to check existing branch names and prevent duplications.

## Status

This script is currently in development. The current version is `1.0.0`.

## Contact

Created by [@borjalofe](https://github.com/borjalofe) - feel free to contact me!
