# Obsidian Task Template

A template for creating standardized task documentation in Obsidian. This template automatically generates task entries with consistent formatting, project tracking, and branch naming conventions.

## Prerequisites

- [Obsidian](https://obsidian.md/) installed on your system
- [Templater](https://github.com/SilentVoid13/Templater) plugin installed in your Obsidian vault
  - A properly configured templates folder for Templater
    - Go to Settings > Templater
    - Set the Template folder location to your templates directory
- A structured Obsidian vault with:
  - A root projects folder (e.g., "01 - PROJECTS")
  - A tasks subfolder (e.g., "01 - PROJECTS/tasks")

## Installation

1. Download the `task.md` template file
2. Place the template file in your Obsidian vault's templates folder
   - If you don't have a templates folder, create one (e.g., `Templates/`)
   - Move `task.md` into this folder

## Usage

### Initial Setup

1. Open the `task.md` template file
2. Configure the template variables in the "Setup variables" section:
   - `projects`: List of available projects
   - `projectIds`: Project identifiers
   - `codebases`: GitHub repository links
   - `projectIdsWithPRDs`: Projects requiring PRD references
   - `taskTypes`: Types of tasks
   - `taskTypeIds`: Task type identifiers
3. Customize the `actualPrd` function according to your PRD naming rules
4. Configure the folder template:
   - Scroll to the "Folder Templates" section
   - Click the "+" button to add a new entry
   - Set the folder path where you store tasks (e.g., "01 - PROJECTS/tasks")
   - Select the `task.md` template file

### Creating a New Task

1. Navigate to your tasks folder
2. Create a new note
3. The template will interactively prompt you for:
   - Task title
   - Project selection
   - PRD reference (if applicable)
   - Affected countries (ISO 2-letter codes)
   - Bug fix status
   - Trello URL

### Generated Content

The template will create a structured document with:

- Automatic git branch name following the pattern:
  `{feature|bugfix}/{prd}-{countries}-{task-name}`
- Project-specific GitHub repository links
- Frontmatter metadata including:
  - Affected countries
  - Creation date
  - Bug status
  - PRD reference
  - Project association
  - Task timeline
- Standard sections:
  - Description
  - Tasks
  - Sources
  - Journal entries
  - Initial git branch creation command

### File Organization

Tasks are automatically organized in the tasks folder using the naming convention:
`{PRD}{COUNTRIES}{BUG?} - {TaskTitle}`

## Customization

You can customize the template by:
1. Modifying the predefined lists in the setup variables section
2. Adjusting the PRD validation rules
3. Changing the git branch naming convention
4. Adding or removing frontmatter metadata fields
5. Modifying the document sections structure

## Future Enhancements

1. Add code to get data from task management tools (e.g., Jira, Trello)
   - As I ask for the original URL, I can get task title, description and list of subtasks from the tool
   - Maybe I can get the PRD from the tool
   - Maybe I can get the project from the tool
   - Maybe I can get the countries from the tool
2. Add code to generate git branch name from PRD, countries and task title
   - Add both the command for creating the branch and the branch name as first task journal entry
   - Add a task journal entry to log the creation of the branch
3. Add code to generate the actual PR to close the task
   - Add a task journal entry to log the creation of the PR
   - Add PR to metadata -pr attribute-
   - Add code to add PR URL as commnent in the task management tool card
