# Obsidian Weekly Review Template

A template for creating structured weekly review notes in Obsidian. This template automatically generates weekly entries with consistent formatting, date tracking, and reference linking to previous weeks.

## Prerequisites

- [Obsidian](https://obsidian.md/) installed on your system
- [Templater](https://github.com/SilentVoid13/Templater) plugin installed in your Obsidian vault
  - A properly configured templates folder for Templater
    - Go to Settings > Templater
    - Set the Template folder location to your templates directory
- [Journals](https://github.com/srg-kostyrko/obsidian-journal) plugin installed in your Obsidian vault
  - A properly configured journal with:
    - A journal folder (e.g., "01 - Journals")

## Installation

1. Download the `weekly.md` template file
2. Place the template file in your Obsidian vault's templates folder
   - If you don't have a templates folder, create one (e.g., `Templates/`)
   - Move `weekly.md` into this folder

## Usage

### Initial Setup

1. Open the `weekly.md` template file
2. Configure the template variables:
   - Locate the "Setup variables" section
   - Set the `extraLinks` variable according to your needs
3. For every journal, set this template as default template for weekly notes:
   - Go to Settings > Journal
   - For every journal, go to the Weekly Notes section
   - Set the Template input to the path of the "weekly" template

### Creating Weekly Reviews

1. Create new notes following the naming convention:
   - Format: YYYY-WXX (e.g., 2024-W48)
2. The template will automatically generate:
   - Structured frontmatter with metadata
   - Creation and modification dates
   - Previous week reference
   - Calendar navigation

### Template Features

- **Frontmatter Metadata**
  - Creation date
  - Update date
  - Tags (journal, review, weekly)
  - Publishing status
  - Document type
  - Aliases

- **Automatic Calculations**
  - Previous week number
  - Dynamic linking to previous week's notes

- **Organized Sections**
  - Team meeting notes
  - Previous weekly notes reference
  - Issues tracking link

- **Integration Features**
  - Calendar navigation component
  - Callouts for important information
  - External links to issues tracking

## Customization

You can customize the template by:
1. Modifying the frontmatter tags
2. Adding or removing sections
3. Customizing the `extraLinks` variable for additional references

## Support

If you encounter any issues or have suggestions for improvements, please open an issue in the repository.

## Future Enhancements

1. Copy goals and compromises from previous week's notes as tasks to be fulfilled
