---
layout: guide
title: Starting a Session
permalink: /guides/session/
redirect_from: /docs/session/
modified_date: 2021-03-12
---

### Opening a Browser

Once you've [installed Watir](../installation), and your [desired drivers](../drivers),
and have an open irb session, you can try out opening a browser with:

{% highlight ruby %}
require 'watir'
browser = Watir::Browser.new
{% endhighlight %}
to close the browser:
{% highlight ruby %}
browser.close
{% endhighlight %}

By default Watir will open a Chrome Browser. To open other browsers, 
specify the one you want as the first argument:
{% highlight ruby %}
Watir::Browser.new :firefox
Watir::Browser.new :internet_explorer
Watir::Browser.new :edge
Watir::Browser.new :safari
{% endhighlight %}

To open a browser on a remote machine, specify the url after the browser argument

{% highlight ruby %}
Watir::Browser.new :firefox, url: "http://#{the_grid_url}:4444/wd/hub"
{% endhighlight %}

Check out the [Capabilities Guide](../capabilities) for how you can both
ensure that you are getting the session you want, and to specify how
the browser should behave during the session.
