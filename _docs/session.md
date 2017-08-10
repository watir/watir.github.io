---
layout: page
title: Starting a Session
permalink: /docs/session/
---

### Opening a Browser

Once you've [installed Watir](../installation), and your [desired drivers](../drivers),
and have an open irb session, you can try out opening a browser with:

{% highlight ruby %}
require 'watir'
Watir::Browser.new
{% endhighlight %}

By default Watir will open a Chrome Browser. 

To open other browsers:
{% highlight ruby %}
Watir::Browser.new :firefox
Watir::Browser.new :internet_explorer
Watir::Browser.new :edge
Watir::Browser.new :safari
{% endhighlight %}

To open a browser on a remote machine, specify the url:

{% highlight ruby %}
Watir::Browser.new :firefox, url: "http://#{the_grid_url}:4444/wd/hub"
{% endhighlight %}

There are many settings that can be customized on each browsers:
* [Chrome](../chrome)
* [Firefox](../firefox)
* [Internet Explorer](../ie)
* [Safari](../safari)
* [Edge](../edge)
