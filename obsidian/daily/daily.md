---
<%*
/**
* Setup variables
*/
const contactsFolder = "02 - AREAS/jobmates";
const extras = [
    {
        condition: (date) => date.getDay() % 7 === 1, // Is monday?
        tasks: ["12:00 - [Backlog Planning](https://meet.google.com/<id>)"],
        sections: []
    },
    {
        condition: (date) => date.getDay() % 7 === 3, // Is wednesday?
        tasks: ["12:30 - [Team Meeting](https://meet.google.com/<id>)"],
        sections: [(date) => {
            const thisWeek = getYearWeek(date);
            const lastWednesday = calculateDate(date, -7);
            const lastWeek = getYearWeek(lastWednesday);
            return `### Team Meeting\n\n![[${thisWeek}#Team Meeting Notes]]\n\n![[${lastWeek}#Team Meeting Notes]]\n\n > [!warning] [Issues' Tracking](https://docs.google.com/document/d/<id>/edit)`;
        }]
    },
];
/** End of Setup */

const title = tp.file.title.includes("Untitled") ? `${tp.file.last_modified_date("YYYY-MM-DD")}` : tp.file.title;
const created_on = tp.file.creation_date("YYYY-MM-DD");
const updated_on = tp.file.last_modified_date("YYYY-MM-DD");

const calculateDate = (date, days, format = 'YYYY-MM-DD') => {
    const result = new Date(date);
    result.setDate(result.getDate() + days);
    
    // Get components
    const year = result.getFullYear();
    const month = String(result.getMonth() + 1).padStart(2, '0');
    const day = String(result.getDate()).padStart(2, '0');

    // Replace format tokens
    return format
        .replace('YYYY', year)
        .replace('MM', month)
        .replace('DD', day);
};

const getYearWeek = (date) => {
    // Create a copy to avoid modifying the input date
    const targetDate = new Date(date);
    
    // Get the year
    const year = targetDate.getFullYear();
    
    // Set to nearest Thursday (makes the week number calculation accurate)
    targetDate.setDate(targetDate.getDate() + 3 - (targetDate.getDay() + 6) % 7);
    
    // Get first day of year
    const firstDay = new Date(year, 0, 1);
    
    // Calculate full weeks to nearest Thursday
    const weekNumber = Math.ceil(((targetDate - firstDay) / 86400000 + 1) / 7);
    
    // Format week number with leading zero if needed
    const paddedWeek = weekNumber.toString().padStart(2, '0');
    
    return `${year}-W${paddedWeek}`;
};

const dailyDate = new Date(title);
const tasks = [];
const sections = [];

// Weekly extras
extras.forEach(extra => {
    if (extra.condition(dailyDate)) {
        extra.tasks.forEach(task => {
            if (typeof task === "function") {
                tasks.push(task(dailyDate));
            } else {
                tasks.push(task);
            }
        });
        section.forEach(section => {
            if (typeof section === "function") {
                sections.push(section(dailyDate));
            } else {
                sections.push(section);
            }
        });
    }
});

const sectionsList = sections.map(section => `${section}`).join("\n\n");

const getDateWithoutYear = (date) => {
    const prefix = date.getMonth() < 9 ? "0" : "";
    const month = `${prefix}${date.getMonth()+1}`;
    const day = date.getDate() < 10 ? `0${date.getDate()}` : `${date.getDate()}`
    return `${month}-${day}`;
}
const getDateDiff = (start, end) =>
    (new Date(end - start).getFullYear() - 1970)

const ephemerisDate = getDateWithoutYear(dailyDate);
const ephemerisSeparator = "birthdate:: ⏳";
const ephemerisRegex = new RegExp(`${ephemerisSeparator}\\d{4}-${ephemerisDate}`);
const socialFiles = (await tp.app.vault.getMarkdownFiles())
    .filter((file) =>
        file.path.includes(contactsFolder));
const ephemerisFiles = await Promise.all(
    socialFiles.map(file => tp.app.vault.cachedRead(file))
);
const ephemerisTasks = ephemerisFiles
    .filter(content => content.match(ephemerisRegex))
    .map(content =>
        content.split("\n")
        .filter(line => line.match(ephemerisRegex))
        .map(line => getDateDiff(
            new Date(line.split(ephemerisSeparator)[1]),
            dailyDate
        ))
    )
    .map((age, index) => 
        `09:00 - [[${socialFiles[index].basename}]]'s BDay (${age})`);
    
const tasksList = tasks
    .concat(ephemerisTasks)
    .sort((a, b) => a.localeCompare(b))
    .map(task => `- [ ] ${task}`).join("\n");
%>
aliases:

created_on: <% created_on %>
cssclass: 
publish: false
tags:
  - journal
  - review
  - daily
type: Journal
updated_on: <% updated_on %>
---
```calendar-nav
```

# <% title %>

<% tasksList %>

## Notes

<% sectionsList %>

## Finished Tasks

