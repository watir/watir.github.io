---
layout: guide
title: Chrome
permalink: /guides/chrome/
redirect_from: /docs/chrome/
modified_date: 2021-03-12
---

### ChromeDriver

To use Chrome, ensure you're [using the appropriate driver](../drivers)

### Starting Chrome
Chrome is the default, so you don't even have to specify it unless you need to add capabilities.
{% highlight ruby %}
b = Watir::Browser.new
{% endhighlight %}

### Chrome Options
*Note: this documentation has been updated for Watir 6.19, and is focused on
supporting the updates made for Selenium 4.*

For non-browser specific capabilities take a look at our [Capabilities Guide](../capabilities)
In addition to those, there are 
[a number of Chrome specific settings](http://chromedriver.chromium.org/capabilities#TOC-Recognized-capabilities)
that will change how Chrome operates during the test run. 

Watir will build the options for you when you pass in a Hash that is based on
[Selenium's `Chrome::Options` class](https://github.com/SeleniumHQ/selenium/blob/trunk/rb/lib/selenium/webdriver/chrome/options.rb)

Commonly used settings include:
* :args - an Array of command-line arguments to use when starting Chrome
* :binary - a String representing the Path to the Chrome Browser executable to use
* :prefs - a Hash with each entry consisting of the name of the preference and its value
* :extensions - an Array of Strings listing the paths to (.crx) Chrome extensions to install on startup
* :emulation -  A Hash for [raw emulation options](http://chromedriver.chromium.org/mobile-emulation). 
  (*it is important to note that the key must be `:emulation`, not `:mobile_emulation`*)

### Preferences
Information on configuring preferences can be found [here](https://www.chromium.org/administrators/configuring-other-preferences)

Example:
{% highlight ruby %}
prefs = {
  download: {
    prompt_for_download: false,
    default_directory: '/path/to/dir'
  }
}

b = Watir::Browser.new :chrome, options: {prefs: prefs}
{% endhighlight %}

### Arguments
See the full list of switches [here](https://peter.sh/experiments/chromium-command-line-switches/)

Example:
{% highlight ruby %}
args = ['--disable-translate']
b = Watir::Browser.new :chrome, options: {args: args}
{% endhighlight %}

### Headless
Chrome provides a headless mode, which Watir provides access to with a top level capability:

{% highlight ruby %}
b = Watir::Browser.new :chrome, headless: true
{% endhighlight %}
Caveats:
* This isn't a "full" browser, so not all features may work
* It is unlikely to speed up your tests by much in most cases
* If you are using Linux you are likely better off using the [headless gem](../headless)

[comment]: <> (Additional things to add:)
[comment]: <> (* Certificates)
[comment]: <> (* Downloads)
[comment]: <> (* Headless)
[comment]: <> (* Mobile Emulation?)
[comment]: <> (* Proxies)
