# 🚀 Quick Update Guide

## Most Common Updates

### 📄 Add a New Publication

1. Create a new file in `_publications/` folder:
   - Filename: `YYYY-MM-DD-short-title.md`
   - Example: `2024-03-15-machine-learning-security.md`

2. Use this template:
```markdown
---
title: "Your Paper Title Here"
collection: publications
permalink: /publication/short-name
excerpt: 'One sentence description of your paper'
date: 2024-03-15
venue: 'Conference or Journal Name'
paperurl: 'https://link-to-paper.com'
citation: 'Author(s). (2024). Paper Title. Venue, pages.'
---

Brief description of the paper...

[Download paper here](https://link-to-paper.com)
```

### 📚 Add a New Course

1. Create a new file in `_teaching/` folder:
   - Filename: `YYYY-semester-course-name.md`
   - Example: `2024-fall-data-science.md`

2. Use this template:
```markdown
---
title: "Course Title"
collection: teaching
type: "Undergraduate Course"  # or "Graduate Course"
permalink: /teaching/course-shortname
venue: "UAIC, Faculty of Computer Science"
semester: "Fall 2024"
current: true
date: 2024-09-01
excerpt: "Brief course description"
---

## Course Overview
Detailed description...
```

### 🎤 Add a New Talk

1. Create a new file in `_talks/` folder:
   - Filename: `YYYY-MM-DD-talk-title.md`

2. Use this template:
```markdown
---
title: "Talk Title"
collection: talks
type: "Conference presentation"
permalink: /talks/talk-name
venue: "Conference Name"
date: 2024-06-15
location: "City, Country"
---

Talk description...

[Download slides](/files/talk-slides.pdf)
```

### 📄 Update Your CV

1. Replace the PDF file in `/files/` folder
2. Update the link in `_pages/cv.md` if needed

### 🖼️ Update Profile Photo

1. Add new photo to `/images/` folder
2. Update `_config.yml`:
```yaml
author:
  avatar: "new-profile-photo.jpg"
```

### 📝 Update About Page

Edit `_pages/about.md` with your latest information.

## Quick Commands

```bash
# Test locally
bundle exec jekyll serve

# Publish changes
git add .
git commit -m "Description of changes"
git push origin master
```

## File Locations Cheat Sheet

- **Personal info**: `_config.yml`
- **Publications**: `_publications/`
- **Teaching**: `_teaching/`
- **Talks**: `_talks/`
- **About page**: `_pages/about.md`
- **CV**: `_pages/cv.md`
- **Documents/PDFs**: `files/`
- **Images**: `images/`
- **Navigation menu**: `_data/navigation.yml`

## Tips

- Always test locally before publishing
- Use descriptive commit messages
- Keep file names lowercase with hyphens
- Optimize images (< 1MB each)
- Update regularly for best SEO
