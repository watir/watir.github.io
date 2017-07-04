---
layout: page
title: Chrome
permalink: /docs/chrome/
---

### ChromeDriver

Chrome support is through the platform specific ChromeDriver binary, which you [download](https://sites.google.com/a/chromium.org/chromedriver/downloads) and put on your path.
{% highlight ruby %}
b = Watir::Browser.new :chrome
{% endhighlight %}

### Chrome Preferences
{% highlight ruby %}
prefs = {
  download: {
    prompt_for_download: false,
    default_directory: '/path/to/dir'
  }
}

b = Watir::Browser.new :chrome, prefs: prefs
{% endhighlight %}

### Chrome Switches
{% highlight ruby %}
b = Watir::Browser.new :chrome,
                       switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)
{% endhighlight %}
See the full list of switches [here](https://src.chromium.org/viewvc/chrome/trunk/src/chrome/common/pref_names.cc)


### Using a proxy with Chrome
{% highlight ruby %}
b = Watir::Browser.new :chrome, switches: %w(--proxy-server=myproxy.com:8080)
{% endhighlight %}


### Using chrome on Heroku

You can drive the chrome browser on heroku with a cedar-14 stack.  Check out this sample repo for more information on how to do this:

https://github.com/jormon/minimal-chrome-on-heroku-xvfb
