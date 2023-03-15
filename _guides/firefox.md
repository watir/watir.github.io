---
layout: guide
title: Firefox
permalink: /guides/firefox/
redirect_from: /docs/firefox/
---

### GeckoDriver

To use Firefox, ensure you're [using the appropriate driver](../drivers)
Geckodriver is attempting to be 100% compliant with the soon to be released
[W3C WebDriver Specification](https://w3c.github.io/webdriver/webdriver-spec.html),
so it is not yet feature complete. It is recommended that you use the latest browser 
version available to have the most complete feature set.

### Starting Firefox

{% highlight ruby %}
b = Watir::Browser.new :firefox
{% endhighlight %}

### Headless

Firefox has a headless feature that can be accessed directly with: 

{% highlight ruby %}
b = Watir::Browser.new :firefox, headless: true
{% endhighlight %}

However this syntax is deprecated by Selenium so the following syntax should be prefered.

{% highlight ruby %}
b = Watir::Browser.new :firefox, options: {args: ['-headless']}
{% endhighlight %}

It also possible to use [the Headless gem](/guides/headless/).

### Firefox Options
All options are explained on the [geckodriver page](https://github.com/mozilla/geckodriver#webdriver-capabilities)

* :args - an Array of command-line arguments to use when starting Firefox
* :binary - a String representing the Path to the Firefox Browser executable to use
* :profile - an encoded profile string or Firefox::Profile instance
* :log_level - the String or Symbol representing the desired log level for geckodriver
* :prefs - a Hash with each entry consisting of the key of the preference and its value

### Firefox Profiles

You can specify an existing profile to use, such as your ‘default’ profile:

{% highlight ruby %}
b = Watir::Browser.new :firefox, profile: 'default'
{% endhighlight %}

You can also create a new Firefox profile each test run using any of the options 
that you can configure in the about:config pane of Firefox

For example:

{% highlight ruby %}
profile = Selenium::WebDriver::Firefox::Profile.new
profile['browser.download.dir'] = '/tmp/webdriver-downloads'
profile['browser.download.folderList'] = 2
profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/pdf'

b = Watir::Browser.new :firefox, profile: profile
{% endhighlight %}

<!--- TODO: Link to other guides with browser specific info --->
