# Git Automation Scripts

This repo contains a collection of scripts to automate various tasks related to working with Git repos. These scripts aim to improve efficiency and streamline the development workflow.

## Table of Contents

- [Git Automation Scripts](#git-automation-scripts)
  - [Table of Contents](#table-of-contents)
  - [Intro](#intro)
  - [Technologies](#technologies)
  - [Scripts](#scripts)
    - [General scripts](#general-scripts)
  - [How to use it](#how-to-use-it)
  - [Status](#status)
  - [Contributing](#contributing)
  - [License](#license)
  - [Contact](#contact)

## Intro

As developer I've always missing some more time to do a better job, to enforce better practices, or ensure I follow the standards as strictly as possible.

Since I finished my studies, the more work I do, the more I realize real environments have time and resources constraints as a rule. And if anything unexpected happens, those constraints grow to a point where we must decide which best practice are we going to miss.

I've created this repo to keep all the automations I' coming up with so I can use them as base of my dev workflow thus enabling me to have time enough to do my best as my normal work and try to still hit it when the unexpected comes to say hi.

My aim when creating this repo is trying to add more scripts to cover more use cases.

## Technologies

These Git Automation Scripts are created with:

- Shellscript

- Git specific packages -like `glab` for GitLab-

## Scripts

The scripts are divided in:

- General category: scripts you can use in any git repo

- [REPO] category: scripts you can use in a [REPO]'s instance (e.g. GitHub, GitLab, ...)

Here is a list of the scripts available in this repository.

### General scripts

1. [git-branch](./general/git-branch)

   The script `git-branch` is a script that automatically creates a branch with the name provided as argument and pushes it to the remote repository.

1. [git-pmr-description](./general/git-pmr-description)

   The script `git-pmr-description` is a script that automatically generates a description for a Pull/Merge Request based on the commits in the branch.

## How to use it

To use these scripts, simply clone this repository to your local machine and run the desired script in your terminal within your Git repository folder structure.

## Status

This project is currently being developed.

## Contributing

We welcome contributions to this repository! If you have a script you'd like to add or an improvement to an existing script, please open a pull request.

## License

These scripts are released under the [GPL v3.0 License](./LICENSE).

## Contact

Created by [@borjalofe](https://github.com/borjalofe) - feel free to contact me!
