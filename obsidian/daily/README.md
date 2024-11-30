# Obsidian Daily Journal Template

An automated daily journal template for Obsidian that generates tasks and schedules meetings based on the day of the week. It includes special handling for birthdays and recurring team activities.

## Prerequisites

Before using this template, ensure you have:

- [Obsidian](https://obsidian.md/) installed on your system
  - A contacts folder (e.g., "02 - AREAS/jobmates") for birthday tracking
- [Templater](https://github.com/SilentVoid13/Templater) plugin installed in your Obsidian vault
  - A properly configured templates folder for Templater
    - Go to Settings > Templater
    - Set the Template folder location to your templates directory
- [Journals](https://github.com/srg-kostyrko/obsidian-journal) plugin installed in your Obsidian vault
  - A properly configured journal with:
    - A journal folder (e.g., "01 - Journals")

## Installation

1. Download the `daily.md` template file
2. Place the template file in your Obsidian templates folder

## Usage

### Initial Setup

1. Configure the template variables:
   - Open the `daily.md` template
   - Locate the "Setup variables" section
   - Set the `contactsFolder` variable to match your vault's structure (e.g., "02 - AREAS/jobmates")
   - Set the `extras` array to define your custom tasks and sections for specific days using functions that accept the current date as an argument and return a boolean
2. For every journal, set this template as default template for daily notes:
   - Go to Settings > Journal
   - For every journal, go to the Daily Notes section
   - Set the Template input to the path of the "daily" template

### Date Management

- Automatic date formatting (YYYY-MM-DD)
- Week number calculations
- Previous/Next date navigation
- Birthday date difference calculations

### Day-Specific Tasks

- Automatic date-specific tasks for daily, weekly, biweekly, monthly, quarterly, and yearly tasks are supported
- Supports custom tasks and sections for specific days using functions that accept the current date as an argument and return a boolean

### Features

#### Birthday Tracking

- Automatically scans contact files for birthdays
- Calculates ages
- Creates birthday reminder tasks

#### Structured Sections

- Calendar navigation
- Daily tasks checklist
- Meeting notes (when applicable)
- Completed tasks section

#### Metadata Management

- Creation and update dates
- Consistent tagging (journal, review, daily)
- Publishing status
- Document type classification

To use the template:

1. Create a new note in your vault
2. Open the command palette (Ctrl/Cmd + P)
3. Search for "Templater: Insert Template"
4. Select the daily template
5. The template will automatically generate the appropriate content based on the current date

The template will automatically populate with day-specific tasks, meetings, and any birthday reminders for your contacts.

## Future Enhancements

1. Rewrite unfinished tasks to reflect the actual task status and copy them to a new note