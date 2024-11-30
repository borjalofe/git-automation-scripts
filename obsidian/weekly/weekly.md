---
<%*
/**
* Setup variables
*/
const extraLinks = [
    {label: "Issues' Tracking", link: 'https://docs.google.com/document/d/15genSsW21Lu5PIs3w3GCOCrVFZYm8r1InVTb5ptaH5c/edit?tab=t.0#task=paG_KIAeEP5c8ZDG'},
];
/** End of Setup */
const title = tp.file.title;
const created_on = tp.file.creation_date("YYYY-MM-DD");
const updated_on = tp.file.last_modified_date("YYYY-MM-DD");

const getPreviousWeekNumber = (yearWeek) => {
    // Parse year and week from the input string
    const [year, week] = yearWeek.split('-W').map(Number);
    return `${year}-W${week - 1}`;
};

const previousWeeklyDate = getPreviousWeekNumber(title, -7);
const extraLinksList = extraLinks.map(
        ({label, link}) => `> [!warning] [${label}](${link})`
    )
    .join("\n\n");
%>
aliases:

created_on: <% created_on %>
cssclass: 
publish: false
tags:
  - journal
  - review
  - weekly
type: Journal
updated_on: <% updated_on %>
---
```calendar-nav
```

# <% title %>

## Team Meeting Notes



## Previous Weekly Notes

> [!note] ![[<% previousWeeklyDate %>#Team Meeting Notes]]

<% extraLinksList %>
