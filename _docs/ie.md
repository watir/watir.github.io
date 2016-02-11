---
layout: page
title: Internet Explorer
permalink: /docs/ie/
---

### IE on Windows

Internet Explorer is Windows only (duh!) and only works if you ensure that protected mode is either all on, or all off, for all zones.

{% highlight ruby %}
b = Watir::Browser.new :ie
{% endhighlight %}

###Internet Explorer Config

Watir-WebDriver uses your standard IE settings and config, so you should manually adjust IE to how you want it before running your tests, which will pick up these settings.
