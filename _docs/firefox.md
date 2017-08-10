---
layout: page
title: Firefox
permalink: /docs/firefox/
---

### It Just Works™

Firefox is supported through a JavaScript driver, therefore ‘it just works™’ on all platforms provided you've installed [https://github.com/mozilla/geckodriver/releases](geckodriver).

{% highlight ruby %}
b = Watir::Browser.new :firefox
{% endhighlight %}

### Firefox Profiles

By default, the Firefox driver creates a new Firefox profile for each test run, which is the recommended action.

You can specify an existing profile to use, such as your ‘default’ profile:

{% highlight ruby %}
b = Watir::Browser.new :firefox, profile: 'default'
{% endhighlight %}

You can also create a new Firefox profile each test run using any of the options that you can configure in the about:config pane of Firefox

For example:

{% highlight ruby %}
profile = Selenium::WebDriver::Firefox::Profile.new
profile['browser.download.dir'] = '/tmp/webdriver-downloads'
profile['browser.download.folderList'] = 2
profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/pdf'

b = Watir::Browser.new :firefox, profile: profile
{% endhighlight %}

### Native Events on Microsoft Windows

Native events are enabled on Windows by default and intend to provide a lower level interaction between webdriver and the operating system. However, these seem to cause problems in certain conditions. These can be easily disabled by setting the option on the Firefox profile:

{% highlight ruby %}
profile = Selenium::WebDriver::Firefox::Profile.new
profile.native_events = false
Watir::Browser.new :firefox, profile: profile
{% endhighlight %}


### Using Firebug with Watir-WebDriver

First download the Firebug xpi file, then use the following code:

{% highlight ruby %}
profile = Selenium::WebDriver::Firefox::Profile.new
profile.add_extension '../path/to/firebug.xpi'
b = Watir::Browser.new :firefox, profile: profile
{% endhighlight %}
