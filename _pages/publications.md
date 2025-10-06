---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
---

<div class="publications-header">
  <h2 style="margin-top: 0;">Research Publications</h2>
  <p>My research focuses on cybersecurity, malware detection, and machine learning applications in security. Below you'll find my published works in peer-reviewed conferences and journals.</p>
  
  {% if site.author.googlescholar %}
    <div style="margin: 1.5rem 0;">
      <a href="{{ site.author.googlescholar }}" class="btn btn--primary" target="_blank">
        📊 View Google Scholar Profile
      </a>
      <a href="{{ site.author.researchgate }}" class="btn btn--outline" target="_blank" style="margin-left: 0.5rem;">
        🔬 ResearchGate Profile
      </a>
    </div>
  {% endif %}
</div>

<hr style="margin: 2rem 0;">

<div class="publications-grid">
  {% for post in site.publications reversed %}
    <div class="publication-card">
      {% include archive-single.html %}
    </div>
  {% endfor %}
</div>

{% if site.publications.size == 0 %}
  <div style="text-align: center; padding: 3rem; background: #f8fafc; border-radius: 1rem; border: 1px solid #e2e8f0;">
    <h3>Publications Coming Soon</h3>
    <p>I'm currently working on several research papers. Check back soon for updates!</p>
  </div>
{% endif %}
