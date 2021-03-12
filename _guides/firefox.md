---
layout: guide
title: Firefox
permalink: /guides/firefox/
redirect_from: /docs/firefox/
modified_date: 2021-03-12
---

### GeckoDriver

To use Firefox, ensure you're [using the appropriate driver](../drivers)

### Starting Firefox

{% highlight ruby %}
b = Watir::Browser.new :firefox
{% endhighlight %}

### Firefox Options
*Note: this documentation has been updated for Watir 6.19, and is focused on
supporting the updates made for Selenium 4.*

For non-browser specific capabilities take a look at our [Capabilities Guide](../capabilities)
In addition to those, there are
[a number of Firefox specific settings](https://github.com/mozilla/geckodriver#webdriver-capabilities)
that will change how Firefox operates during the test run.

Watir will build the options for you when you pass in a Hash that is based on
[Selenium's `Firefox::Options` class](https://github.com/SeleniumHQ/selenium/blob/trunk/rb/lib/selenium/webdriver/firefox/options.rb)

Commonly used settings include:
* :args - an Array of command-line arguments to use when starting Firefox
* :binary - a String representing the Path to the Firefox Browser executable to use
* :profile - an encoded profile string or Firefox::Profile instance
* :log_level - the String or Symbol representing the desired log level for geckodriver
* :prefs - a Hash with each entry consisting of the key of the preference and its value

### Firefox Profiles

You can specify an existing profile to use, such as your ‘default’ profile:

{% highlight ruby %}
b = Watir::Browser.new :firefox, options: {profile: 'default'}
{% endhighlight %}

You can also create a new Firefox profile each test run using any of the options 
that you can configure in the about:config pane of Firefox

For example:

{% highlight ruby %}
profile = Selenium::WebDriver::Firefox::Profile.new
profile['browser.download.dir'] = '/tmp/webdriver-downloads'
profile['browser.download.folderList'] = 2
profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/pdf'

b = Watir::Browser.new :firefox, options: {profile: profile}
{% endhighlight %}

<!--- TODO: Link to other guides with browser specific info --->
