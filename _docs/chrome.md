---
layout: page
title: Chrome
permalink: /docs/chrome/
---

### ChromeDriver

To use Chrome, ensure you're [using the appropriate driver](../docs/drivers)

### Starting Chrome

{% highlight ruby %}
b = Watir::Browser.new
{% endhighlight %}


### Headless
Chrome has a new headless feature that can be accessed directly with: 

`Watir::Browser.new :chrome, headless: true`

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
