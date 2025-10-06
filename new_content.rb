#!/usr/bin/env ruby
# encoding: utf-8

# Simple script to create new content files with proper templates
# Usage: ruby new_content.rb [type] [title]
# Types: publication, teaching, talk, research

require 'date'
require 'fileutils'

def create_publication(title)
  date = Date.today
  slug = title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/-+$/, '')
  filename = "_publications/#{date.strftime('%Y-%m-%d')}-#{slug}.md"
  
  content = <<~CONTENT
    ---
    title: "#{title}"
    collection: publications
    permalink: /publication/#{slug}
    excerpt: 'Brief description of the paper'
    date: #{date.strftime('%Y-%m-%d')}
    venue: 'Conference or Journal Name'
    paperurl: 'https://link-to-paper.com'
    citation: 'Author(s). (#{date.year}). #{title}. Venue, pages.'
    ---

    ## Abstract
    Brief description of the paper...

    ## Key Contributions
    - Contribution 1
    - Contribution 2

    [Download paper here](https://link-to-paper.com)

    ## BibTeX
    ```bibtex
    @article{author#{date.year}#{slug.gsub('-', '')},
      title={#{title}},
      author={Your Name},
      journal={Journal Name},
      year={#{date.year}},
      publisher={Publisher}
    }
    ```
  CONTENT
  
  File.write(filename, content)
  puts "Created: #{filename}"
end

def create_teaching(title)
  date = Date.today
  slug = title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/-+$/, '')
  filename = "_teaching/#{date.strftime('%Y')}-#{slug}.md"
  
  content = <<~CONTENT
    ---
    title: "#{title}"
    collection: teaching
    type: "Undergraduate Course"
    permalink: /teaching/#{slug}
    venue: "UAIC, Faculty of Computer Science"
    semester: "#{date.strftime('%B %Y')}"
    credits: "6 ECTS"
    enrollment: "30"
    current: true
    date: #{date.strftime('%Y-%m-%d')}
    syllabus: "/files/#{slug}-syllabus.pdf"
    materials: "/teaching/#{slug}-materials/"
    assignments: "/teaching/#{slug}-assignments/"
    excerpt: "Brief course description"
    ---

    ## Course Overview
    This course covers...

    ### Learning Objectives
    - Objective 1
    - Objective 2
    - Objective 3

    ### Course Topics
    1. **Topic 1**
       - Subtopic A
       - Subtopic B
       
    2. **Topic 2**
       - Subtopic C
       - Subtopic D

    ### Assessment
    - Assignments: 40%
    - Midterm Exam: 25%
    - Final Project: 25%
    - Participation: 10%

    ### Resources
    - [Course Materials](/teaching/#{slug}-materials/)
    - [Assignments](/teaching/#{slug}-assignments/)
    - [Course Syllabus](/files/#{slug}-syllabus.pdf)

    ### Contact
    **Email:** bprelipcean_at_info.uaic.ro  
    **Office Hours:** Tuesdays & Thursdays, 2:00-4:00 PM
  CONTENT
  
  File.write(filename, content)
  puts "Created: #{filename}"
end

def create_talk(title)
  date = Date.today
  slug = title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/-+$/, '')
  filename = "_talks/#{date.strftime('%Y-%m-%d')}-#{slug}.md"
  
  content = <<~CONTENT
    ---
    title: "#{title}"
    collection: talks
    type: "Conference presentation"
    permalink: /talks/#{slug}
    venue: "Conference Name"
    date: #{date.strftime('%Y-%m-%d')}
    location: "City, Country"
    ---

    ## Abstract
    Talk description...

    ## Key Points
    - Point 1
    - Point 2
    - Point 3

    ## Resources
    - [Download slides](/files/#{slug}-slides.pdf)
    - [Video recording](https://link-to-video.com)
    - [Conference website](https://conference-website.com)
  CONTENT
  
  File.write(filename, content)
  puts "Created: #{filename}"
end

def create_research(title)
  date = Date.today
  slug = title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/-+$/, '')
  filename = "_research/#{date.strftime('%Y')}-#{slug}.md"
  
  content = <<~CONTENT
    ---
    title: "#{title}"
    collection: research
    type: "Research Project"
    permalink: /research/#{slug}
    date: #{date.strftime('%Y-%m-%d')}
    status: "Ongoing"
    funding: "Grant Agency Name"
    excerpt: "Brief project description"
    ---

    ## Project Overview
    Detailed description of the research project...

    ## Objectives
    - Objective 1
    - Objective 2
    - Objective 3

    ## Methodology
    Description of research methods...

    ## Expected Outcomes
    - Outcome 1
    - Outcome 2

    ## Publications
    - [Paper 1](/publication/paper1)
    - [Paper 2](/publication/paper2)

    ## Funding
    This project is supported by [Grant Agency Name], Grant #12345.

    ## Collaborators
    - Collaborator 1, Institution
    - Collaborator 2, Institution
  CONTENT
  
  File.write(filename, content)
  puts "Created: #{filename}"
end

# Main script logic
if ARGV.length < 2
  puts "Usage: ruby new_content.rb [type] [title]"
  puts "Types: publication, teaching, talk, research"
  puts "Example: ruby new_content.rb publication 'My New Paper Title'"
  exit 1
end

type = ARGV[0].downcase
title = ARGV[1]

case type
when 'publication', 'pub'
  create_publication(title)
when 'teaching', 'course'
  create_teaching(title)
when 'talk', 'presentation'
  create_talk(title)
when 'research', 'project'
  create_research(title)
else
  puts "Unknown type: #{type}"
  puts "Supported types: publication, teaching, talk, research"
  exit 1
end

puts "✅ Content created successfully!"
puts "💡 Don't forget to:"
puts "   1. Edit the file with your specific content"
puts "   2. Add any associated files (PDFs, images) to the files/ folder"
puts "   3. Test locally: bundle exec jekyll serve"
puts "   4. Commit and push: git add . && git commit -m 'Add #{title}' && git push"
