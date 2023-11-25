# Git Pre Pull / Merge Request Script

This script is designed to ease pull / merge request handling by generating a pull / merge request description.

## Table of Contents

- [Git Pre Pull / Merge Request Script](#git-pre-pull--merge-request-script)
  - [Table of Contents](#table-of-contents)
  - [Intro](#intro)
  - [Technologies](#technologies)
  - [How to use it](#how-to-use-it)
    - [Output](#output)
    - [Help](#help)
    - [Examples](#examples)
  - [Features](#features)
  - [ToDo](#todo)
  - [Status](#status)
  - [Contact](#contact)

## Intro

Whenever you want to merge a branch into another, you need to create a pull / merge request. This request usually includes a description of the changes made in the branch, and the reason for the merge.

This script is designed to ease this process by generating a pull / merge request description based on the commits made in the branch.

## Technologies

This script is written in Bash, and uses the following tools:

- [Git](https://git-scm.com/): To get the current user, the current repo, the current branch, the commits made in the branch, and the commit messages.

- [GNU sed](https://www.gnu.org/software/sed/) and [GNU awk](https://www.gnu.org/software/gawk/): To format the commit messages.

- [Bash](https://www.gnu.org/software/bash/): To run the script.

## How to use it

Firstly, you need to clone the repository that contains the script:

```bash
git clone git@github.com:borjalofe/git-automation-scripts.git
cd git-automation-scripts
chmod +x ./general/git-pmr-description/git-pmr-description.sh
```

I suggest you to add the script to your cli setup -in the example I'll use bash-, so you can run it from anywhere. To do so, you can add the following line to your `.bash_aliases` file:

```bash
alias git-pmr-description="path/to/git-automation-scripts/general/git-pmr-description/git-pmr-description.sh"
```

Then, you can run `git-pmr-description` in your terminal within your Git repository folder structure with various options:

```bash
git-pmr-description 1.0.0
Usage: git-pmr-description [{-h | --help}]

git-pmr-description is a script to generate correctly a new pull / merge request's description

where:
 -h, --help                    shows this help text
```

```bash
git-pmr-description
```

### Output

The script generates a title based on the name of the current branch and then lists the commits made from the develop branch to the current branch in the format:

```MarkDown
# Branch Title

## Tasks

1. Commit Title

   Commit Description
```

Each commit title is presented as a numbered list, and the description for each commit (if it exists) is presented underneath the corresponding commit title.

### Help

For help on how to use this script, you can run:

```Bash
./git-pre-merge -h
```

or

```bash
./git-pre-merge --help
```

These commands will display a help message that describes how to use the script.

### Examples

On a branch named `feat/my-new-awesome-feature` with four commits, the script will output:
  
  ```bash
  git-pmr-description
  # Output:
  #   # Feat / My Awesome Feature
  #
  #   ## Tasks
  #
  #   1. First Commit Title
  #
  #      First Commit Description
  #
  #   2. Second Commit Title
  #
  #      Second Commit Description
  #
  #   3. Third Commit Title
  #
  #      Third Commit Description
  #
  #   4. Fourth Commit Title
  #
  #      Fourth Commit Description
  ```

## Features

- The script will automatically detect if the current folder is part of a Git repository. If not, it will show an error message and exit.

- The script will automatically detect the current branch and uses `develop` as the base branch against which to compare it.

- Automated generation of pull / merge request description based on the commits made in the branch.

## ToDo

- **Configurable Base Branch:** Modify the script to accept an argument specifying the base branch against which to compare the current branch. If not provided, the script should default to using the `develop` branch.

- **Commit Filters:** Extend the script to allow filtering of commits based on attributes such as date, or specific commit messages.

- **Specify Commit's Authors:** Allow the user to specify one or more authors to include or exclude their commits. This feature could be useful in scenarios where you want to filter out commits by bots or certain team members.

- **More Detailed Commit Information:** Add options to include more detailed information in the commit descriptions, such as the files changed or the lines of code added/removed.

- **Generate Links to Commits:** If the repository is hosted on a platform like GitHub or GitLab, generate clickable links to each commit in the merge request description.

- **Interactive Mode:** Add an interactive mode where the script prompts the user for input on things like branch names, commit filters, etc.

- **Integration with Task Management Tools:** If tasks are being tracked in an external tool like Jira, Trello, or Asana, provide integration so that the merge request description can include relevant task links or statuses.

  - Another interesting feature here would be use this description to close / move the task in the external task management tool -e.g. add a `Close <issue-id>` to close the task in Jira-.

- **Template Customization:** Allow users to specify a custom template for the merge request description, to better adapt to team-specific needs or workflows.

## Status

This script is currently in development. The current version is `1.0.0`.

## Contact

Created by [@borjalofe](https://github.com/borjalofe) - feel free to contact me!
