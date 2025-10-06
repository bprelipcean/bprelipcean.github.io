# 🔧 Troubleshooting Guide

## Common Setup Issues

### Bundle Install Fails (Permission Issues)

If you see `Bundler requires sudo access to install`, try these solutions:

#### Option 1: Use Bundler with User Installation
```bash
bundle config set --local path 'vendor/bundle'
bundle install
```

#### Option 2: Use rbenv or RVM (Recommended)
```bash
# Install rbenv (macOS)
brew install rbenv ruby-build

# Install a Ruby version
rbenv install 3.1.0
rbenv global 3.1.0

# Then try bundle install again
bundle install
```

#### Option 3: Use System Ruby with User Gems
```bash
gem install --user-install bundler jekyll
bundle config set --local path ~/.gem
bundle install
```

### Site Not Building

#### Check Jekyll Version Compatibility
```bash
# Check current versions
bundle exec jekyll --version
bundle exec gem list github-pages

# Update if needed
bundle update github-pages
```

#### Clear Jekyll Cache
```bash
bundle exec jekyll clean
rm -rf _site .jekyll-cache
bundle exec jekyll build
```

### Changes Not Appearing on GitHub Pages

1. **Wait 5-10 minutes** - GitHub Pages takes time to build
2. **Check Repository Settings** - Ensure Pages is enabled
3. **Verify File Names** - Check for typos in filenames
4. **Check YAML Front Matter** - Ensure proper syntax

### Markdown Rendering Issues

#### Common YAML Front Matter Errors
```yaml
# ❌ Wrong
---
title: My Title Without Quotes
date: 2024-1-1
---

# ✅ Correct
---
title: "My Title With Quotes"
date: 2024-01-01
---
```

#### Special Characters in Titles
```yaml
# ❌ Wrong
title: My Title: A Subtitle

# ✅ Correct
title: "My Title: A Subtitle"
```

### Images Not Displaying

#### Check File Paths
```markdown
# ❌ Wrong
![Image](images/photo.jpg)

# ✅ Correct (from root)
![Image](/images/photo.jpg)

# ✅ Correct (relative)
![Image]({{ site.baseurl }}/images/photo.jpg)
```

#### Optimize Image Sizes
- Keep images under 1MB
- Use appropriate formats (JPG for photos, PNG for graphics)
- Consider using image compression tools

### Local Development Issues

#### Port Already in Use
```bash
# Use different port
bundle exec jekyll serve --port 4001

# Or kill existing process
lsof -ti:4000 | xargs kill -9
```

#### Live Reload Not Working
```bash
# Use with live reload
bundle exec jekyll serve --livereload

# Or force polling
bundle exec jekyll serve --force_polling
```

### Git Issues

#### Large File Size Errors
```bash
# Remove large files from history
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch large-file.pdf' --prune-empty --tag-name-filter cat -- --all

# Or use Git LFS for large files
git lfs track "*.pdf"
git add .gitattributes
```

#### Merge Conflicts
```bash
# Reset to remote version
git fetch origin
git reset --hard origin/master

# Or resolve manually and commit
git add .
git commit -m "Resolve merge conflicts"
```

### Theme-Specific Issues

#### Custom CSS Not Loading
```scss
// In assets/css/main.scss, ensure front matter exists:
---
# Only the main Sass file needs front matter
---

@charset "utf-8";
@import "minimal-mistakes/skins/{{ site.minimal_mistakes_skin | default: 'default' }}";
@import "minimal-mistakes";

// Your custom styles here
```

#### Navigation Not Updating
1. Check `_data/navigation.yml` syntax
2. Ensure proper indentation (spaces, not tabs)
3. Restart Jekyll server after changes

### Performance Issues

#### Slow Build Times
```yaml
# In _config.yml, limit posts in development
limit_posts: 10

# Exclude unnecessary files
exclude:
  - node_modules
  - "*.sublime-project"
  - "*.sublime-workspace"
  - vendor
  - .bundle
  - .sass-cache
```

#### Large Site Size
- Optimize images
- Remove unused files
- Use Jekyll Archives for pagination

## Getting Help

### Check These First
1. **Jekyll Build Errors**: Run `bundle exec jekyll build --verbose`
2. **GitHub Pages Status**: Check GitHub Pages status page
3. **Browser Cache**: Hard refresh (Ctrl+Shift+R / Cmd+Shift+R)
4. **Syntax Validation**: Use online YAML validators

### Resources
- **Jekyll Documentation**: https://jekyllrb.com/docs/
- **GitHub Pages Help**: https://help.github.com/en/github/working-with-github-pages
- **Minimal Mistakes Issues**: https://github.com/mmistakes/minimal-mistakes/issues
- **Academic Pages Community**: https://github.com/academicpages/academicpages.github.io/issues

### Common File Extensions
- `.md` - Markdown files (content)
- `.html` - HTML files (layouts, includes)
- `.yml` - YAML configuration files
- `.scss` - Sass stylesheets
- `.rb` - Ruby scripts

### Testing Checklist
Before publishing changes:
- [ ] Local build works: `bundle exec jekyll build`
- [ ] Local server works: `bundle exec jekyll serve`
- [ ] All links work
- [ ] Images display correctly
- [ ] Mobile responsive
- [ ] No console errors

---

**Still having issues?** Create an issue on GitHub or contact: bprelipcean_at_info.uaic.ro
