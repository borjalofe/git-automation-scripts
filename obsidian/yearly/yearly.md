---
<%*
const thisYear = tp.file.title.includes("Untitled") ? `${tp.file.last_modified_date("YYYY")}` : tp.file.title;
const tenYearsAgo = `${+thisYear - 10}`;
const fiveYearsAgo = `${+thisYear - 5}`;
const fiveYearsFromNow = `${+thisYear + 5}`;
const tenYearsFromNow = `${+thisYear + 10}`;
const created_on = tp.file.creation_date("YYYY-MM-DD")
const updated_on = tp.file.last_modified_date("YYYY-MM-DD")
%>
aliases:

created_on: <% created_on %>
cssclass: 
publish: false
tags:
  - journal
  - review
  - yearly
type: Journal
updated_on: <% updated_on %>
---
# <% thisYear %>

```calendar-nav
```

## Goals

### From this year (Jan 1st, <% thisYear %>)

![[yearly planning]]

### From 5 years ago (Jan 1st, <% fiveYearsAgo %>)

![[<% fiveYearsAgo %>#In five years (Dec 31st, <% thisYear %>)]]

### From 10 years ago (Jan 1st, <% tenYearsAgo %>)

![[<% tenYearsAgo %>#In ten years (Dec 31st, <% thisYear %>)]]

## Review


### Books I've Read



### Series & Movies I've Watched



### Adventures

- 

> [!multi-column]
>  
>  > [!success] Positive
>  > 
>  > 1. 
>  
>  > [!danger] Negative
>  > 
>  > 1. 

### Traditions

- 

> [!multi-column]
>  
>  > [!success] Positive
>  > 
>  > 1. 
>  
>  > [!danger] Negative
>  > 
>  > 1. 

### Learning

- 

> [!multi-column]
>  
>  > [!success] Positive
>  > 
>  > 1. 
>  
>  > [!danger] Negative
>  > 
>  > 1. 

### Trips & Travels

- 

> [!multi-column]
>  
>  > [!success] Positive
>  > 
>  > 1. 
>  
>  > [!danger] Negative
>  > 
>  > 1. 

### Creativity

- 

> [!multi-column]
>  
>  > [!success] Positive
>  > 
>  > 1. 
>  
>  > [!danger] Negative
>  > 
>  > 1. 

### Job, Work & Professional Carreer

- 

> [!multi-column]
>  
>  > [!success] Positive
>  > 
>  > 1. 
>  
>  > [!danger] Negative
>  > 
>  > 1. 

### Relationships

- 

> [!multi-column]
>  
>  > [!success] Positive
>  > 
>  > 1. 
>  
>  > [!danger] Negative
>  > 
>  > 1. 

### Mental Health

- 

> [!multi-column]
>  
>  > [!success] Positive
>  > 
>  > 1. 
>  
>  > [!danger] Negative
>  > 
>  > 1. 

### Body Health

- 

> [!multi-column]
>  
>  > [!success] Positive
>  > 
>  > 1. 
>  
>  > [!danger] Negative
>  > 
>  > 1. 

## The future

### In five years (Dec 31st, <% fiveYearsFromNow %>)



### In ten years (Dec 31st, <% tenYearsFromNow %>)

