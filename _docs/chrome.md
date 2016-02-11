---
layout: page
title: Chrome
permalink: /docs/chrome/
---

### ChromeDriver

Chrome support is through the platform specific ChromeDriver binary, which you [download](http://code.google.com/p/chromedriver/downloads/list) and put on your path.
{% highlight ruby %}
b = Watir::Browser.new :chrome
{% endhighlight %}

### Chrome Preferences
{% highlight ruby %}
prefs = {
  :download => {
    :prompt_for_download => false,
    :default_directory => "/path/to/dir"
  }
}

b = Watir::Browser.new :chrome, :prefs => prefs
{% endhighlight %}

### Chrome Switches
{% highlight ruby %}
b = Watir::Browser.new :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]
{% endhighlight %}
See the full list of switches [here](http://src.chromium.org/svn/trunk/src/chrome/common/pref_names.cc)


### Using a proxy with Chrome
{% highlight ruby %}
b = Watir::Browser.new :chrome, :switches => %w[--proxy-server=myproxy.com:8080]
{% endhighlight %}
