# 🖥️ Local Development on Mac - Complete Guide

## 🚀 Quick Start

### **FASTEST METHOD: Use the automated script**

```bash
cd /Users/bprelipcean/Academic/FCS/repos/bprelipcean.github.io
./serve.sh
```

This script will try multiple methods automatically and use the first one that works.

### **Traditional Method (if Ruby works properly)**

```bash
cd /Users/bprelipcean/Academic/FCS/repos/bprelipcean.github.io
bundle install
bundle exec jekyll serve
```

Then open: http://localhost:4000

### **Docker Method (if you have Docker installed)**

```bash
cd /Users/bprelipcean/Academic/FCS/repos/bprelipcean.github.io
docker-compose up --build
```

Then open: http://localhost:4000

## 🔧 Fixing Common Mac Issues

### Permission Errors with System Ruby

If you see `Bundler requires sudo access`, DO NOT use sudo. Instead:

#### Solution 1: Local Bundle Installation
```bash
# Configure bundler to install gems locally
bundle config set --local path 'vendor/bundle'

# Install dependencies
bundle install

# Run the site
bundle exec jekyll serve
```

#### Solution 2: Homebrew Ruby (Recommended)
```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Ruby
brew install ruby

# Add to PATH (choose your shell)
# For zsh (default on newer Macs):
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# For bash:
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

# Verify Ruby version
ruby -v
which ruby

# Install bundler
gem install bundler

# Install project dependencies
bundle install

# Run the site
bundle exec jekyll serve
```

### M1/M2 Mac Specific Issues

If you have an Apple Silicon Mac (M1/M2), you might need:

```bash
# Install with correct architecture
arch -arm64 brew install ruby

# Or if you encounter native extension issues:
bundle config build.nokogiri --use-system-libraries
bundle install
```

## 📋 Development Commands

### Basic Commands
```bash
# Install dependencies
bundle install

# Run development server
bundle exec jekyll serve

# Run with live reload (auto-refresh browser)
bundle exec jekyll serve --livereload

# Run on different port
bundle exec jekyll serve --port 4001

# Build site (without serving)
bundle exec jekyll build

# Clean generated files
bundle exec jekyll clean
```

### Advanced Development
```bash
# Run with drafts included
bundle exec jekyll serve --drafts

# Run with future posts
bundle exec jekyll serve --future

# Force polling (if auto-reload not working)
bundle exec jekyll serve --force_polling

# Verbose output for debugging
bundle exec jekyll serve --verbose
```

## 🛠️ Content Creation Workflow

### 1. Create New Content
```bash
# Create new publication
ruby new_content.rb publication "Paper Title"

# Create new course
ruby new_content.rb teaching "Course Name"

# Create new talk
ruby new_content.rb talk "Presentation Title"
```

### 2. Edit Content
- Open the generated file in your text editor
- Add your specific content
- Save the file

### 3. Test Locally
```bash
# Start the server
bundle exec jekyll serve --livereload

# Open browser to http://localhost:4000
# Changes will auto-reload in browser
```

### 4. Publish
```bash
git add .
git commit -m "Add new content: Description"
git push origin master
```

## 📁 File Organization

### Where to Put Files

```
Your Project/
├── _config.yml              # Site configuration
├── _publications/           # Research papers
├── _teaching/              # Course information
├── _talks/                 # Presentations
├── _pages/                 # Static pages
├── files/                  # PDFs, documents
│   ├── cv/
│   ├── publications/
│   ├── teaching/
│   └── talks/
├── images/                 # Photos, figures
└── assets/                 # CSS, JS files
```

### Document Naming Convention
```bash
# Publications
2024-03-15-paper-title.md

# Teaching
2024-spring-course-name.md

# Talks
2024-06-10-conference-talk.md
```

## 🔍 Troubleshooting

### Site Not Loading
```bash
# Check if server is running
lsof -ti:4000

# Kill existing process if needed
lsof -ti:4000 | xargs kill -9

# Restart server
bundle exec jekyll serve
```

### Changes Not Appearing
1. Hard refresh browser: `Cmd + Shift + R`
2. Check file syntax (YAML front matter)
3. Restart Jekyll server
4. Clear Jekyll cache: `bundle exec jekyll clean`

### Build Errors
```bash
# Verbose build to see errors
bundle exec jekyll build --verbose

# Check specific file syntax
bundle exec jekyll build --trace
```

### Gem Installation Issues
```bash
# Update RubyGems
gem update --system

# Clear gem cache
gem cleanup

# Reinstall bundler
gem uninstall bundler
gem install bundler

# Clear bundle cache
rm -rf vendor/bundle
bundle install
```

## 📱 Testing on Mobile

### Local Network Access
```bash
# Find your local IP
ifconfig | grep "inet " | grep -v 127.0.0.1

# Start server with host binding
bundle exec jekyll serve --host 0.0.0.0

# Access from mobile: http://YOUR_IP:4000
```

### Responsive Testing
- Use browser developer tools
- Test on actual devices
- Check navigation on mobile
- Verify image sizing

## ⚡ Performance Tips

### Faster Development
```bash
# Limit posts during development
# Add to _config.yml:
limit_posts: 5

# Exclude heavy directories
exclude:
  - node_modules
  - vendor
  - .bundle
```

### Optimize Images
```bash
# Install ImageOptim (GUI app)
# Or use command line tools
brew install imageoptim-cli

# Optimize images
imageoptim images/*.jpg
```

## 🔄 Keeping Updated

### Update Dependencies
```bash
# Update all gems to latest compatible versions
bundle update

# Update specific gem
bundle update minimal-mistakes-jekyll

# Update GitHub Pages gem
bundle update github-pages
```

### Update Jekyll
```bash
# Check current version
bundle exec jekyll --version

# Update to latest compatible version
bundle update jekyll
```

## 📞 Getting Help

### Check These First
1. **Ruby Version**: `ruby -v` (should be 2.7+)
2. **Bundler Version**: `bundle -v`
3. **Jekyll Version**: `bundle exec jekyll -v`
4. **Git Status**: `git status`

### Common Solutions
- **Permission errors**: Use Homebrew Ruby or local bundle path
- **Port conflicts**: Use different port `--port 4001`
- **Cache issues**: Run `bundle exec jekyll clean`
- **Gem conflicts**: Delete `Gemfile.lock` and run `bundle install`

### Resources
- **Jekyll Documentation**: https://jekyllrb.com/docs/
- **Minimal Mistakes Guide**: https://mmistakes.github.io/minimal-mistakes/
- **Ruby Installation**: https://www.ruby-lang.org/en/documentation/installation/
- **Homebrew**: https://brew.sh/

---

**Need more help?** Check `TROUBLESHOOTING.md` or contact: bprelipcean_at_info.uaic.ro
