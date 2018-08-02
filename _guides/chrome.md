---
layout: guide
title: Chrome
permalink: /guides/chrome/
redirect_from: /docs/chrome/
---

### ChromeDriver

To use Chrome, ensure you're [using the appropriate driver](../drivers)

### Starting Chrome
Chrome is the default, so you don't even have to specify it unless you need to add capabilities.
{% highlight ruby %}
b = Watir::Browser.new
{% endhighlight %}
{% highlight ruby %}
b = Watir::Browser.new :chrome, opts
{% endhighlight %}


### Headless
Chrome has a new headless feature that can be accessed directly with: 

{% highlight ruby %}
b = Watir::Browser.new :chrome, headless: true
{% endhighlight %}

It is still under active development so not all features work yet (alerts, window
switching, etc)

### Chrome Options

The options hash can be created with the following parameters:

* :args - an Array of command-line arguments to use when starting Chrome
* :binary - a String representing the Path to the Chrome Browser executable to use
* :prefs - a Hash with each entry consisting of the name of the preference and its value
* :extensions - an Array of Strings listing the paths to (.crx) Chrome extensions to install on startup
* :options - a Hash for raw options
* :emulation -  A Hash for raw emulation options


### Preferences
Information on configuring preferences can be found [here](https://www.chromium.org/administrators/configuring-other-preferences)

{% highlight ruby %}
prefs = {
  download: {
    prompt_for_download: false,
    default_directory: '/path/to/dir'
  }
}

b = Watir::Browser.new :chrome, options: {prefs: prefs}
{% endhighlight %}

### Switches
See the full list of switches [here](https://peter.sh/experiments/chromium-command-line-switches/)

{% highlight ruby %}
args = ['--ignore-certificate-errors', '--disable-popup-blocking', '--disable-translate']
b = Watir::Browser.new :chrome, options: {args: args}
{% endhighlight %}

### Raw Options
See the full list of options [here](https://sites.google.com/a/chromium.org/chromedriver/capabilities#TOC-chromeOptions-object)

{% highlight ruby %}
b = Watir::Browser.new :chrome, options: {options: {detach: true}}
{% endhighlight %}

<!--- TODO: Create a separate Guide for this --->

### Using chrome on Heroku

You can drive the chrome browser on heroku with a cedar-14 stack.  Check out this sample repo for more information on how to do this:
https://github.com/jormon/minimal-chrome-on-heroku-xvfb

You can also run using a headless chrome on the heroku-16 stack.  Here's an example of that working: 
https://github.com/jormon/minimal-chrome-on-heroku

<!--- TODO: Link to other guides with browser specific info --->

<!--- 
* Certificates
* Downloads
* Headless
* Mobile Emulation?
* Proxies
-->
