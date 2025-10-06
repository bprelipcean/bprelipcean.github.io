# 🌐 Academic Website Setup & Management Guide

This guide will help you manage and update your modernized academic website built with Jekyll and the latest Minimal Mistakes theme.

## 🚀 Quick Start

### 1. Initial Setup

#### Requirements
- **Ruby** 2.5+ and **Bundler**
- **Git** for version control
- **Text editor** (VS Code, Atom, etc.)

#### First-time Setup
```bash
# Clone your repository
git clone https://github.com/bprelipcean/bprelipcean.github.io.git
cd bprelipcean.github.io

# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve

# Visit http://localhost:4000 to see your site
```

### 2. Key Files Overview

```
├── _config.yml           # Main site configuration
├── _data/
│   └── navigation.yml    # Site navigation menu
├── _pages/              # Static pages (About, CV, etc.)
├── _posts/              # Blog posts
├── _publications/       # Your publications
├── _teaching/           # Course information
├── _talks/              # Conference talks
├── _research/           # Research projects
├── files/               # PDFs, documents
├── images/              # Images and photos
└── assets/              # CSS, JS, fonts
```

## 📝 Content Management

### Personal Information (_config.yml)

Update your personal details in `_config.yml`:

```yaml
# Site Settings
title: "Your Name"
name: "Your Name"
description: "Your bio/description"
url: https://yourusername.github.io

# Author Information
author:
  name: "Your Name"
  avatar: "profile.jpg"  # Place in /images/
  bio: "Your short bio"
  location: "Your Location"
  employer: "Your Institution"
  email: "your.email@domain.com"
  googlescholar: "https://scholar.google.com/citations?user=YOUR_ID"
  linkedin: "https://linkedin.com/in/yourprofile"
  github: "yourusername"
  # Add other social media profiles
```

### Adding Publications

Create files in `_publications/` directory:

```markdown
---
title: "Your Paper Title"
collection: publications
permalink: /publication/paper-shortname
excerpt: 'Brief description of the paper'
date: 2024-01-15
venue: 'Conference/Journal Name'
paperurl: 'http://link-to-paper.com'
citation: 'Your citation format'
---

## Abstract
Your paper abstract here...

## Key Contributions
- Contribution 1
- Contribution 2

[Download paper here](http://link-to-paper.com)
```

### Adding Teaching Content

Create course files in `_teaching/` directory:

```markdown
---
title: "Course Name"
collection: teaching
type: "Undergraduate/Graduate Course"
permalink: /teaching/course-shortname
venue: "Institution Name"
semester: "Fall 2024"
credits: "3 ECTS"
enrollment: "30"
current: true  # true for current courses, false for past
date: 2024-09-01
syllabus: "/files/course-syllabus.pdf"
materials: "/teaching/course-materials/"
assignments: "/teaching/course-assignments/"
excerpt: "Brief course description"
---

## Course Overview
Detailed course description...

## Learning Objectives
- Objective 1
- Objective 2

## Assessment
- Exams: 50%
- Projects: 30%
- Participation: 20%
```

### Adding Research Projects

Create files in `_research/` directory:

```markdown
---
title: "Research Project Title"
collection: research
type: "Research Project"
permalink: /research/project-name
date: 2024-01-01
status: "Ongoing" # Ongoing, Completed, Planned
funding: "Grant Agency Name"
excerpt: "Brief project description"
---

## Project Overview
Detailed description...

## Objectives
- Goal 1
- Goal 2

## Publications
- [Paper 1](/publication/paper1)
- [Paper 2](/publication/paper2)
```

### Adding Talks

Create files in `_talks/` directory:

```markdown
---
title: "Talk Title"
collection: talks
type: "Conference presentation"
permalink: /talks/talk-name
venue: "Conference Name"
date: 2024-03-15
location: "City, Country"
---

## Abstract
Talk abstract...

[Download slides](http://link-to-slides.com)
```

## 🎨 Customization

### Changing Theme Appearance

Modify the theme skin in `_config.yml`:

```yaml
minimal_mistakes_skin: "default"
# Options: "air", "aqua", "contrast", "dark", "dirt", "neon", "mint", "plum", "sunrise"
```

### Adding Custom CSS

Create or edit `assets/css/main.scss`:

```scss
---
# Only the main Sass file needs front matter (the dashes are enough)
---

@charset "utf-8";

@import "minimal-mistakes/skins/{{ site.minimal_mistakes_skin | default: 'default' }}"; // skin
@import "minimal-mistakes"; // main partials

// Your custom styles here
.custom-class {
  color: #your-color;
}
```

### Navigation Menu

Edit `_data/navigation.yml`:

```yaml
main:
  - title: "About"
    url: /about/
  - title: "Publications"
    url: /publications/
  - title: "Teaching"
    url: /teaching/
  - title: "CV"
    url: /cv/
```

## 📁 File Management

### Document Organization

```
files/
├── cv/
│   └── your-cv.pdf
├── publications/
│   ├── paper1.pdf
│   └── paper2.pdf
├── teaching/
│   ├── course1-syllabus.pdf
│   └── course2-materials.zip
└── talks/
    ├── talk1-slides.pdf
    └── talk2-poster.pdf
```

### Image Management

```
images/
├── profile.jpg          # Your profile photo
├── bio-photo.jpg        # Alternative bio photo
├── publications/
│   ├── paper1-fig1.png
│   └── paper2-diagram.jpg
└── teaching/
    ├── course1-logo.png
    └── lab-setup.jpg
```

## 🔧 Advanced Features

### Search Functionality

Search is enabled by default. Configure in `_config.yml`:

```yaml
search: true
search_full_content: true
search_provider: lunr  # lunr, algolia, google
```

### Analytics

Add Google Analytics in `_config.yml`:

```yaml
analytics:
  provider: "google-gtag"
  google:
    tracking_id: "YOUR-TRACKING-ID"
    anonymize_ip: false
```

### Comments

Enable comments in `_config.yml`:

```yaml
comments:
  provider: "disqus"
  disqus:
    shortname: "your-disqus-shortname"
```

## 🚀 Publishing & Updates

### Local Testing

Always test locally before publishing:

```bash
# Serve locally with drafts
bundle exec jekyll serve --drafts

# Build for production
bundle exec jekyll build
```

### Publishing to GitHub Pages

```bash
# Add changes
git add .

# Commit with descriptive message
git commit -m "Add new publication: Paper Title"

# Push to GitHub
git push origin master

# Site will be live at https://yourusername.github.io in a few minutes
```

### Regular Maintenance

#### Monthly Tasks
- Update dependencies: `bundle update`
- Check for broken links
- Review and update CV
- Add new publications/talks

#### Semester Tasks
- Update teaching section with new courses
- Archive completed courses (set `current: false`)
- Update research project status
- Refresh profile photo if needed

## 🛠️ Troubleshooting

### Common Issues

#### Bundle Install Fails
```bash
# Update Ruby gems
gem update --system
bundle install
```

#### Site Not Building
```bash
# Check for syntax errors
bundle exec jekyll build --verbose

# Clear cache
bundle exec jekyll clean
bundle exec jekyll build
```

#### Changes Not Appearing
- Clear browser cache
- Check file paths (case-sensitive)
- Verify YAML front matter syntax
- Wait 5-10 minutes for GitHub Pages to update

### Getting Help

1. **Jekyll Documentation:** https://jekyllrb.com/docs/
2. **Minimal Mistakes Guide:** https://mmistakes.github.io/minimal-mistakes/
3. **GitHub Pages Help:** https://help.github.com/en/github/working-with-github-pages
4. **Markdown Guide:** https://www.markdownguide.org/

## 📋 Content Templates

### Quick Publication Entry
```markdown
---
title: "Paper Title"
collection: publications
date: 2024-01-01
venue: 'Journal Name'
excerpt: 'Brief description'
---
```

### Quick Teaching Entry
```markdown
---
title: "Course Name"
collection: teaching
type: "Course Type"
current: true
semester: "Fall 2024"
excerpt: 'Course description'
---
```

### Quick Talk Entry
```markdown
---
title: "Talk Title"
collection: talks
date: 2024-01-01
venue: 'Conference Name'
location: 'City, Country'
---
```

## 🎯 Best Practices

1. **Regular Updates:** Update content monthly
2. **SEO Optimization:** Use descriptive titles and excerpts
3. **Mobile-Friendly:** Test on mobile devices
4. **Fast Loading:** Optimize images (< 1MB each)
5. **Professional Tone:** Maintain consistent voice
6. **Backup:** Keep local backups of important files
7. **Version Control:** Use meaningful commit messages

---

**Need Help?** Contact: bprelipcean_at_info.uaic.ro
