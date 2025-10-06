# 📚 How to Add Your Actual Publications from Google Scholar

## 🎯 Quick Instructions

I've created **template publications** to get you started, but you need to replace them with your **actual publications from Google Scholar**.

## 🔍 Step 1: Get Your Google Scholar Data

1. **Visit your Google Scholar profile**: https://scholar.google.com/citations?user=mv_-vPAAAAAJ
2. **Copy each publication's details**:
   - Title
   - Authors
   - Venue (conference/journal)
   - Year
   - DOI/URL
   - Citation count (optional)

## ✏️ Step 2: Update Template Publications

### For Each Publication, Replace:

```markdown
---
title: "YOUR ACTUAL PAPER TITLE"
collection: publications
permalink: /publication/YEAR-short-title
date: 2024-MM-DD
venue: 'ACTUAL CONFERENCE OR JOURNAL NAME'
paperurl: 'https://doi.org/YOUR-ACTUAL-DOI'
citation: 'Your Name, Co-authors, "Paper Title." Venue, Year.'
excerpt: 'Brief description of what this paper is about'
---

## Abstract
Your actual abstract here...

[Access paper here](https://doi.org/YOUR-ACTUAL-DOI){:target="_blank"}
```

### Example - Replace Template with Real Data:

**BEFORE (Template):**
```markdown
title: "Advanced Machine Learning Approaches for Next-Generation Malware Detection"
venue: 'European Symposium on Research in Computer Security (ESORICS 2022)'
```

**AFTER (Your Real Publication):**
```markdown
title: "Your Actual Paper Title from Google Scholar"
venue: 'The Actual Conference/Journal Name'
```

## 🚀 Step 3: Use the Content Creation Script

Use the script I created to quickly add new publications:

```bash
ruby new_content.rb publication "Your Paper Title Here"
```

Then edit the generated file with your specific details.

## 📋 Step 4: Update These Template Files

Replace the content in these files with your actual publications:

- `_publications/2023-PhD-Thesis-Formal-Verification-Threat-Detection.md`
- `_publications/2022-ESORICS-Advanced-ML-Malware-Detection.md`  
- `_publications/2024-Journal-Cloud-Security-Verification.md`

## 🔗 Google Scholar Integration Tips

### Get DOI Links:

1. On Google Scholar, click your paper
2. Look for "DOI" link or "Publisher" link
3. Copy the full DOI URL (https://doi.org/10.1109/...)

### Get Citation Format:

1. Click "Cite" under your paper on Google Scholar
2. Copy the citation text
3. Paste into the `citation:` field

### Get Paper URLs:

- **Publisher Link**: Best option if available
- **ResearchGate**: Good alternative  
- **arXiv**: For preprints
- **Your personal copy**: Upload PDFs to `/files/` folder

## 📄 Step 5: Add PDFs (Optional)

If you have PDFs of your papers:

1. **Upload PDFs** to `/files/publications/` folder
2. **Update paperurl** in your publication files:
   ```markdown
   paperurl: '/files/publications/your-paper-2024.pdf'
   ```

## ⚡ Quick Batch Update

If you have many publications, create a spreadsheet with:
- Title
- Authors  
- Venue
- Year
- DOI
- Abstract

Then use the Ruby script to quickly generate all files.

## 🎯 Priority Publications

Focus on adding these first:
1. **Your PhD thesis** (most important)
2. **Recent papers (2020+)** 
3. **High-impact papers** (most cited)
4. **Representative work** from different research areas

---

**Need help?** Contact me with your Google Scholar publications list and I can help format them properly!
