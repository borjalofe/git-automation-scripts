<%*
/**
* This template is designed for creating formatted journal annotations in Obsidian
* with support for different callout types, code blocks, and nested content.
* It processes clipboard content and adds proper formatting and metadata.
* 
* To use this template:
* 
* 1. Install the Templater plugin in your Obsidian vault
* 2. Place this file in your templates folder
* 3. Copy the content you want to annotate to your clipboard
* 
* The template will interactively prompt for:
* 
* Annotation Details:
* - Title of the journal annotation
* - Type of annotation from predefined options:
*   • None (default)
*   • Info
*   • Note
*   • Question
*   • Success
*   • Warning
*   • Failure
*   • Danger
*   • Important
*   • Tip
* 
* Code Handling:
* - Whether the content is code
* - If code, language selection from:
*   • Bash
*   • CSS
*   • HTML
*   • JavaScript
*   • TypeScript
*   • YAML
* 
* Formatting Options:
* - Nesting depth for annotations
*   (useful for nested callouts, starting at depth 1)
* 
* Features:
* 
* - Automatic formatting:
*   • Proper callout syntax based on type
*   • Correct nesting levels with quote marks
*   • Code block formatting with language specification
* 
* - Metadata inclusion:
*   • Automatic timestamp addition (date and time)
*   • Internal linking to daily notes
* 
* - Content processing:
*   • Clipboard content retrieval
*   • Line-by-line formatting with proper indentation
*   • Preservation of original content structure
* 
* The template automatically formats the clipboard content according to
* the specified parameters and appends it to the current note, maintaining
* consistent formatting and proper nesting levels throughout the document.
*/
const copiedContent = await tp.system.clipboard();
const title = await tp.system.prompt("What's the title of this journal annotation?");
const journalType = await tp.system.suggester(
    [
        "None",
	    "Info",
	    "Note",
	    "Question",
	    "Success",
	    "Warning",
	    "Failure",
	    "Danger",
	    "Important",
	    "Tip",
    ],
    [
	    "",
	    "info",
	    "note",
	    "question",
	    "success",
	    "warning",
	    "failure",
	    "danger",
	    "important",
	    "tip",
    ],
    false,
    "What type of journal annotation is this?"
);
const isCode = await tp.system.suggester(
    [
        "Yes",
	    "No",
    ],
    [
	    true,
	    false,
    ],
    false,
    "Are you copying code?"
);
const codeLang = isCode ? await tp.system.suggester(
    [
        "Bash",
	    "CSS",
	    "HTML",
	    "JavaScript",
        "TypeScript",
	    "YAML",
    ],
    [
        "bash",
	    "stylesheet",
	    "html",
	    "javascript",
        "typescript",
	    "yaml",
    ],
    false,
    "Are you copying code?"
) : "";
const type = !journalType ? "" : `[!${journalType}] `;
const depth = await tp.system.prompt("Which depth do you want to paste this? -e.g. paste inside another annotation begins at depth 2-", 1);
const [date, timePart] = new Date().toISOString().split("T");
const time = timePart.substring(0,5);

const annotationMark = "> ".repeat(depth);
const formattedContent = copiedContent
    .split("\n")
    .map(line => `${annotationMark}${line}`)
    .join("\n");
const contentToBePasted = `${annotationMark}${type}${title}${+depth === 1 ? ` \\[[[${date}]] @ ${time}]` : ""}\n${isCode ? `${annotationMark}\`\`\`${codeLang}\n` : ""}${annotationMark}\n${formattedContent}\n${isCode ? `${annotationMark}\`\`\`\n` : ""}`;
await tp.file.cursor_append(contentToBePasted);
%>