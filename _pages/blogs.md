---
layout: page
title: Blogs
permalink: /blog-list/
---

Resources with Watir, Ruby or otherwise useful content:

<ul>
  {% for blog in site.data.blogs %}
  <li ><a href = '{{ blog.link }}' target='_blank' rel = 'noopener'>{{ blog.description }}</a></li>
  {% endfor %}
</ul>

#### Archives

Watir related sites and wiki pages that are not used any more.

* http://www.clabs.org/wtr/
* http://rubyforge.org/projects/wtr/
* http://wtr.rubyforge.org/s101/doc
* http://rubyforge.org/pipermail/wtr-general/
* http://infoether.com/~tom/safariwatir-general-archives/
* http://groups.google.com/group/firewatir
* http://rubyforge.org/pipermail/wtr-core/
