---
<%*
/**
* Setup variables
*/
const rdBasePath = "01 - PROJECTS/RDs";
const defaultDrivers = "David Sánchez, Samuel Punzón, Paula Ten";
const defaultApprover = "José Luis Cases";
const defaultContributors = "David Sánchez, Samuel Punzón, Paula Ten";
const defaultInterested = "";
const buyerProfiles = [
    "All",
    "Inner Client",
    "Ruby",
];
/** End of Setup */

const title = await tp.system.prompt("What's the RD proposal title?");
const drivers = await tp.system.prompt(
    `Who are the drivers for "${title}"? -use a comma-separated list to specify them-`,
    defaultDrivers
);
const driversListFrontmatter = drivers.length > 0
    ? drivers
        .split(',')
        .map(driver => `  - ${driver}`)
        .join("\n")
    : "";
const driversList = drivers.length > 0
    ? drivers
        .split(',')
        .map(driver => `[[${driver}]]`)
        .join(" ")
    : "";
const approverInput = await tp.system.prompt(
    `Who's the approver for "${title}"?`,
    defaultApprover
);
const approver = approverInput?.length > 0
    ? `[[${approverInput}]]`
    : "";
const contributors = await tp.system.prompt(
    `Who's going to contribute to "${title}"? -use a comma-separated list to specify them-`,
    defaultContributors
);
const contributorsListFrontmatter = contributors.length > 0
    ? contributors
        .split(',')
        .map(contributor => `  - ${contributor}`)
        .join("\n")
    : "";
const contributorsList = contributors.length > 0
    ? contributors
        .split(',')
        .map(contributor => `[[${contributor}]]`)
        .join(" ")
    : "";
const interested = await tp.system.prompt(
    `Who's interested in "${title}"? -use a comma-separated list to specify them-`,
    defaultInterested
);
const interestedListFrontmatter = interested.length > 0
    ? interested
        .split(',')
        .map(interestedPerson => `  - ${interestedPerson}`)
        .join("\n")
    : "";
const interestedList = interested.length > 0
    ? interested
        .split(',')
        .map(interestedPerson => `[[${interestedPerson}]]`)
        .join(" ")
    : "";

const buyerProfile = await tp.system.suggester(
    buyerProfiles,
    buyerProfiles,
    false,
    `Who're the buyer profile for "${title}"?`
);

const countriesInput = await tp.system.prompt(`Which countries is "${title}" related to? -use a comma-separated list to specify them with a 2-letter standard (e.g. mx for Mexico)-`);
const countries = countriesInput.length > 0
    ? countriesInput
          .split(',')
          .map(c => c.trim())
    : "";
const countriesListFrontmatter = countries.length > 0
    ? countries
      .map(country => `  - ${country}`)
      .join("\n")
    : "";
const countriesList = countries.length > 0
    ? countries
        .map(country => `${country.toUpperCase()}`)
        .join()
    : "";

const iterationsRegex = new RegExp(`\# ${title}`);
const rdTypePattern = new RegExp("type: Research&Development");
const rdPattern = "rd: ";
const extractRd = (text) => {
    const extractedRD = text
        .split("\n")
        .filter(line => line.includes(rdPattern))
        .map(line => line.replace(rdPattern, ""))[0];
    return +extractedRD;
}
const rdFiles = (await tp.app.vault.getMarkdownFiles())
    .filter((file) =>
        file.path.includes(rdBasePath));
const rdFilesContents = rdFiles.length > 0
    ? (await Promise.all(
          rdFiles.map(file => tp.app.vault.cachedRead(file))
      )).filter(content => content.match(rdTypePattern))
    : [];
const iterations = rdFilesContents.length
    ? rdFilesContents
          .filter(content => content.match(iterationsRegex))
    : [];
const iteration = iterations.length > 0 ? iterations.length + 1 : 1;

const rd = rdFilesContents.length === 0
    ? 1
    : iterations.length > 0
        ? extractRd(iterations[0])
        : extractRd(
              rdFilesContents.sort(
                  (a, b) => extractRd(b) - extractRd(a)
              )[0]
          ) + 1;

const generalView = await tp.system.prompt(
    `What's the General View for "${title}"?`,
    "",
    false,
    true
);
const initiative = await tp.system.prompt(
    `What's the Initiative for "${title}"?`,
    "",
    false,
    true
);
const scope = await tp.system.prompt(
    `What's the Scope for "${title}"?`,
    "",
    false,
    true
);
const limitations = await tp.system.prompt(
    `What are the Limitations for "${title}"?`,
    "",
    false,
    true
);
const okrs = await tp.system.prompt(
    `What are the OKRs for "${title}"?`,
    "",
    false,
    true
);
const otherConsiderations = await tp.system.prompt(
    `What other Considerations do we need to take into account for "${title}"?`,
    "",
    false,
    true
);
const focus = await tp.system.prompt(
    `What's the Focus for "${title}"?`,
    "",
    false,
    true
);
const planning = await tp.system.prompt(
    `What's the Planning for "${title}"?`,
    "",
    false,
    true
);
const annexes = await tp.system.prompt(
    `What annexes or links have we curated as inspiration or resources for "${title}"?`,
    "",
    false,
    true
);

const createdOn = tp.file.creation_date("YYYY-MM-DD");

const rdFilename = `RD-${rd} - ${iteration} - ${title}`;
const rdFolder = `RD-${rd} - ${title}`;
await tp.file.move(`${rdBasePath}/${rdFolder}/${rdFilename}`);
if (iteration === 1) {
    await tp.file.create_new(
        `---
approver: ${approver}
buyer_profile: ${buyerProfile}
contributors:
${contributorsListFrontmatter}
countries:
${countriesListFrontmatter}
created_on: ${createdOn}
driver:
${driversListFrontmatter}
interested:
${interestedListFrontmatter}
iteration: ${iteration}
rd: ${rd}
tags: 
rd-start-date: ${createdOn}
rd-end-date: 
type: RDIndex
url: 
---
# ${title}

![[${rdFilename}]]
		`,
        rdFolder,
        false,
        `${rdBasePath}/${rdFolder}`
    );
} else {
    const indexFile = await tp.app.vault.getFileByPath(`${rdBasePath}/${rdFolder}/${rdFolder}.md`);
    if (!!indexFile) {
        await tp.app.vault.append(
            indexFile,
            `\n\n![[${rdFilename}]]`
        );
    }
    
}
%>
approver: <% approver %>
buyer_profile: <% buyerProfile %>
contributors:
<% contributorsListFrontmatter %>
countries:
<% countriesListFrontmatter %>
created_on: <% createdOn %>
drivers:
<% driversListFrontmatter %>
interested:
<% interestedListFrontmatter %>
iteration: <% iteration %>
rd: <% rd %>
tags: 
rd-start-date: <% createdOn %>
rd-end-date: 
type: Research&Development
url: 
---
# <% title %>

| **I+D RD #**      | <% rd %>            |
| :---------------- | :------------------ |
| **Iteration**     | <% iteration %>     |
|                   |                     |
| **Buyer Profile** | <% buyerProfile %>  |
| **Countries**     | <% countriesList %> |

| **DACI Role** |                        |
| :------------ | :--------------------- |
| Drivers       | <% driversList %>      |
| Approver      | [[<% approver %>]]     |
| Contributors  | <% contributorsList %> |
| Interested    | <% interestedList %>   |

## General View

<% generalView %>

## Initiative

<% initiative %>

## Scope and Limitations

### Scope

<% scope %>

### Limitations

<% limitations %>

## OKRs

<% okrs %>

## Other Considerations

<% otherConsiderations %>

## Focus

<% focus %>

## Planning

<% planning %>

## Annexes and Interesting Links

<% annexes %>
