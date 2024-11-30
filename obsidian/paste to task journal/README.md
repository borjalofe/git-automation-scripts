# Obsidian Journal Annotation Template

A template for creating formatted journal annotations in Obsidian with support for different callout types, code blocks, and nested content. This template helps you maintain consistent formatting while annotating content from your clipboard.

## Features

- Automatic formatting with proper callout syntax
- Support for multiple callout types (Info, Note, Question, etc.)
- Code block formatting with language specification
- Nested content support with proper indentation
- Automatic timestamp and metadata inclusion
- Internal linking to daily notes
- Clipboard content processing

## Prerequisites

- [Obsidian](https://obsidian.md/) installed on your system
- [Templater](https://github.com/SilentVoid13/Templater) plugin installed in your Obsidian vault
  - A properly configured templates folder for Templater
    - Go to Settings > Templater
    - Set the Template folder location to your templates directory

## Installation

1. Download the template file (`paste_to_task_journal.md`)
2. Place the template file in your Obsidian vault's templates folder
   - If you don't have a templates folder, create one (e.g., `Templates/`)
   - Move the template file into this folder
3. Configure Templater to recognize the template
   - Open Obsidian Settings
   - Go to Templater settings
   - Ensure your templates folder is correctly set

## Usage

1. Copy the content you want to annotate to your clipboard

2. Create a new note or open an existing one where you want to add the annotation

3. Trigger the template through Templater
   - Use the Templater hotkey or command palette
   - Select this template

4. Follow the interactive prompts to specify:
   - Title of the journal annotation
   - Type of annotation:
     - None (default)
     - Info
     - Note
     - Question
     - Success
     - Warning
     - Failure
     - Danger
     - Important
     - Tip
   
   - For code content:
     - Whether the content is code
     - Programming language selection:
       - Bash
       - CSS
       - HTML
       - JavaScript
       - TypeScript
       - YAML
   
   - Nesting depth for annotations (starts at depth 1)

5. The template will automatically format your clipboard content with the specified parameters and append it to your note

## Example Output

```markdown
> [!note] My Annotation
> Created: [[2024-01-20]] 14:30
> 
> Here is my annotated content with proper formatting
> and structure maintained.
```

For code blocks:

```markdown
> [!note] Code Example
> Created: [[2024-01-20]] 14:30
> 
> ```javascript
> const example = "This is formatted as JavaScript code";
> console.log(example);
> ```