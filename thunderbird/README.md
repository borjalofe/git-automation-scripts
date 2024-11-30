# QuickText Templates for Thunderbird

This repository contains custom QuickText templates and scripts for Mozilla Thunderbird to streamline email communication with professional email signatures and templates.

## Overview

QuickText is a powerful Thunderbird add-on that allows you to create and use templates for frequently sent emails. This repository includes:

- Email templates in Spanish and English
- Professional HTML email signatures
- Utility scripts for template processing
- Dynamic placeholder support for personalization

## Features

- 📝 Pre-formatted email templates with consistent styling
- 🌐 Multilingual support (ES/EN)
- 👤 Dynamic recipient name handling
- ✍️ Professional HTML signature blocks
- 🔗 Automatic link formatting
- 📱 Responsive design for all devices

## Installation

1. Install the QuickText add-on in Thunderbird:
   - Open Thunderbird
   - Go to Tools → Add-ons
   - Search for "QuickText"
   - Click "Install"

2. Import the templates:
   - Go to Tools → QuickText → Settings
   - Click on "Import"
   - Select the `QuickText for Thunderbird - Templates.xml` file
   - Click "OK" to import

3. Import the scripts:
   - In QuickText Settings
   - Go to the "Scripts" tab
   - Click on "Import"
   - Select the `QuickText for Thunderbird - Scripts.xml` file
   - Click "OK" to import

## Usage

### Templates

- **ES - Correo en blanco (Shortcut: 1)**
  - Spanish email template with professional signature
  - Automatically formats recipient names
  
- **EN - Correo en blanco (Shortcut: 2)**
  - English email template with professional signature
  - Automatically formats recipient names

### Variables

The templates use the following variables:
- `[[TO=firstname]]` - Recipient's first name
- `[[FROM=fullname]]` - Your full name
- `[[FROM=jobtitle]]` - Your job title
- `[[FROM=company]]` - Your company name
- `[[FROM=email]]` - Your email address
- `[[FROM=webpage1]]` - Your website URL
- `[[CURSOR]]` - Where the cursor will be placed after inserting the template

## Configuration

1. Set up your personal information:
   - Go to Tools → QuickText → Settings
   - Click on "Variables"
   - Fill in your personal information in the FROM variables

2. Using shortcuts:
   - In Thunderbird's compose window:
   - Press the shortcut number (1 for Spanish, 2 for English)
   - Or use the QuickText dropdown menu to select a template

## Customization

You can modify the templates by:
1. Opening QuickText Settings
2. Selecting the template you want to modify
3. Editing the HTML/text content
4. Saving your changes

## Support

For issues or questions about:
- QuickText add-on: Visit the [QuickText Add-on Page](https://addons.thunderbird.net/thunderbird/addon/quicktext/)
- These templates: Open an issue in this repository

## License

These templates and scripts are provided under the MIT License. Feel free to modify and use them for your needs.
