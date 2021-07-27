---
layout: default
title: "Posts"
---
 
{% if site.show_excerpts %}
  {% include index.md %}
{% else %}
  {% include archive.html title="Posts" %}
{% endif %}
