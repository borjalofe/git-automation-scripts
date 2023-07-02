# git-pre-merge Script

This repository contains the `git-pre-merge` script. This script automatically generates a description for new merge requests based on the commits made from the `develop` branch to the current branch.

## How to use it

To use this script, simply run `git-pre-merge` in your terminal within your Git repository folder structure.

```bash
./git-pre-merge
```

## Output

The script generates a title based on the name of the current branch and then lists the commits made from the develop branch to the current branch in the format:

```MarkDown
# Branch Title

## Tasks

1. Commit Title

   Commit Description
```

Each commit title is presented as a numbered list, and the description for each commit (if it exists) is presented underneath the corresponding commit title.

## Notes

This script should be run inside a Git repository. If you try to run it outside of a Git folder structure, you will be shown an error message and the help.

## Help

For help on how to use this script, you can run:

```Bash
./git-pre-merge -h
```

or

```bash
./git-pre-merge --help
```

These commands will display a help message that describes how to use the script.

## Future ideas

- **Configurable Base Branch:** Modify the script to accept an argument specifying the base branch against which to compare the current branch. If not provided, the script should default to using the `develop` branch.

- **Commit Filters:** Extend the script to allow filtering of commits based on attributes such as date, or specific commit messages.

- **Specify Commit's Authors:** Allow the user to specify one or more authors to include or exclude their commits. This feature could be useful in scenarios where you want to filter out commits by bots or certain team members.

- **More Detailed Commit Information:** Add options to include more detailed information in the commit descriptions, such as the files changed or the lines of code added/removed.

- **Generate Links to Commits:** If the repository is hosted on a platform like GitHub or GitLab, generate clickable links to each commit in the merge request description.

- **Interactive Mode:** Add an interactive mode where the script prompts the user for input on things like branch names, commit filters, etc.

- **Integration with Task Management Tools:** If tasks are being tracked in an external tool like Jira, Trello, or Asana, provide integration so that the merge request description can include relevant task links or statuses.

  - Another interesting feature here would be use this description to close / move the task in the external task management tool -e.g. add a `Close <issue-id>` to close the task in Jira-.

- **Template Customization:** Allow users to specify a custom template for the merge request description, to better adapt to team-specific needs or workflows.
