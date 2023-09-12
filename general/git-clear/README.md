# Git Branch Cleaning Script

This script is designed to help you clean up your local Git repository by automatically deleting all branches except for a specified set of protected branches (develop, master, main, release).

## Table of Contents

- [Git Branch Cleaning Script](#git-branch-cleaning-script)
  - [Table of Contents](#table-of-contents)
  - [Intro](#intro)
  - [Technologies](#technologies)
  - [Installation](#installation)
    - [Permissions](#permissions)
  - [How to use it](#how-to-use-it)
    - [Examples](#examples)
  - [Features](#features)
  - [ToDo](#todo)
  - [Status](#status)
  - [Contact](#contact)

## Intro

Git is great for version control, but over time, it's easy to accumulate many local branches. Manually deleting these branches one by one can be a hassle. This Bash script automates the process by deleting all branches except the important ones (`develop`, `master`, `main`, `release`).

## Technologies

The Git Branch Deletion Script is created with:

- [Git](https://git-scm.com/): To enumerate the branches and execute the deletion commands.

- [Bash](https://www.gnu.org/software/bash/): To run the script.

## Installation

First, clone the repository that contains the script or download the script file:

```bash
git clone git@github.com:borjalofe/git-automation-scripts.git
cd git-automation-scripts
```

### Permissions

To ensure the script is executable, run:

```bash
chmod +x ./general/git-clear/git-clear.sh
```

## How to Use It

After cloning and setting permissions, you can run the script in your terminal:

```bash
./git-clear.sh
```

I suggest you to add the script to your cli setup -in the example I'll use bash-, so you can run it from anywhere. To do so, you can add the following line to your `.bash_aliases` file:

```bash
alias git-clear="path/to/git-automation-scripts/general/git-clear/git-clear.sh"
```

Then, you can run `git-clear` in your terminal within your Git repository folder structure with various options:

```bash
git-clear 1.0.0
Usage: git-clear

git-clear is a script to clean all finished branches in your local git repo
```

### Examples

Simply run the script:

```bash
./git-clear.sh
```

The script will enumerate the branches to delete, ask for confirmation, and then delete them upon approval.

## Features

- Automatic detection of branches to delete (excluding `develop`, `master`, `main`, `release`).

- Interactive confirmation before deletion.

## ToDo

- **Add Logging**: Record deleted branches in a log file.

- **Improve User Feedback**: Provide a summary after deletion.

- **Error Handling**: Include better error messages for issues like lack of Git installation.

- **Configuration File**: Allow users to customize the list of protected branches.

## Status

This script is currently in development. The current version is `1.0.0`.

## Contact

Created by [@borjalofe](https://github.com/borjalofe) - feel free to contact me!
