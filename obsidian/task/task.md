---
<%*
/**
* Setup variables
*/
const projects = [
	"Rankia JAMStack",
	"RankiaPRO",
	"DEV Sala de Máquinas",
	"Roadmap Product&IT"
];
const projectIds = [
	"rankia-next",
	"rankiapro-next",
	"rankia.com",
	"roadmap"
];
const codebases = {
    "rankia-next": "https://github.com/Soluciones/rankia-next",
    "rankiapro-next": "https://github.com/Soluciones/rankiapro-next",
};
const projectIdsWithPRDs = [
	"rankia-next",
	"rankiapro-next",
];
const taskTypes = [
	'Has to do with Investment only',
	'Has to do with Banking only',
	'Has to do with both Investment and Banking',
	'Is a general task'
];
const taskTypeIds = [
	'BLI',
	'BLB',
	'BLALL',
	'BLAPP'
];
/** End of Setup */
const title = await tp.system.prompt("What's the task (title)?");
const cleanTitle = title
    .replace(/[\[\]]/g, '')
    .trim();

const project = await tp.system.suggester(
        projects,
        projectIds,
        false,
        `Which project does ${title} belong to?`
    );

const codebase = project && codebases[project]
    ? `- [Code Base](${codebases[project]})`
    : "";

const prd = projectIdsWithPRDs.includes(project)
        ? await tp.system.prompt(`If there's a PRD -e.g. 74-1- for ${title}, write it here please:`)
        : "";
const actualPrd = !projectIdsWithPRDs.includes(project)
    ? prd
    : prd
        ? `PRD-${prd}`
        : ["rankiapro-next"].includes(project)
            ? "BLPRO"
            : await tp.system.suggester(
                taskTypes,
                taskTypeIds,
                false,
                `As ${title} has no PRD, which Area has to do with?`
            );
const isBugFix = await tp.system.suggester(
        [
            "No",
            "Yes"
        ],
        [
            false,
            true
        ],
        false,
        `${title} is a bug fixing task?`
    );

const countriesInput = await tp.system.prompt(`Which countries is ${title} related to? -use a comma-separated list to specify them with a 2-letter standard (e.g. mx for Mexico)-`);
const countries = countriesInput.length > 0
    ? countriesInput
          .split(',')
          .map(c => c.trim())
    : "";
const countriesAsTags = countries.length > 0
    ? countries
      .map(country => `  - ${country}`)
      .join("\n")
    : "  - all";
const countriesAsTitle = countries.length > 0
    ? countries
        .map(country => `-${country.toUpperCase()}`)
        .join("")
    : "";

const url = await tp.system.prompt(`Please write the Trello URL for ${title}:`);

const created_on = tp.file.creation_date("YYYY-MM-DD");

const branchTitle = cleanTitle
    .toLowerCase()
    .replaceAll("'", '-')
    .replaceAll(' ', '-')
    .replaceAll('--', '-')
    .trim();
const branchName = `${isBugFix ? "bugfix/" : "feature/"}${actualPrd.toLowerCase()}${countriesAsTitle.toLowerCase()}-${branchTitle}`;

const [date, timePart] = new Date().toISOString().split("T");
const time = timePart.substring(0,5);
const firstJournalEntry = `\n> [!info] Create branch for the task \\\[[[${date}]] @ ${time}]\n> \n> To create the branch execute:\n> \n> \`\`\`bash\n> git checkout -b ${branchName}\n> \`\`\`\n> \n>`;

const taskTitle = `[${actualPrd}]${countriesAsTitle}${isBugFix ? "-BUG" : ""} ${title}`;

const taskFilename = `${actualPrd}${countriesAsTitle}${isBugFix ? "-BUG" : ""} - ${cleanTitle}`;
const taskFolder = `01 - PROJECTS/tasks/${taskFilename}`;
await tp.file.move(`${taskFolder}/${taskFilename}`);
%>
countries:
<% countriesAsTags %>
created_on: <% created_on %>
is_bug: <% isBugFix %>
pr: 
prd: <% actualPrd %>
projects:
  - <% project %>
tags: 
task-start-date: <% created_on %>
task-end-date: 
type: Task
url: <% url %>
---
# <% taskTitle %>

## Description



## Tasks

- [ ] 

## Sources

<% codebase %>

## Journal
<% firstJournalEntry %>

