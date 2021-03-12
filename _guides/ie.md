---
layout: guide
title: Internet Explorer
permalink: /guides/ie/
redirect_from: /docs/ie/
modified_date: 2021-03-12
---

### IEDriverServer

To use Internet Explorer, ensure you're [using the appropriate driver](../drivers).
Note that for technical reasons it is recommended to *always* use the 32 bit version of the driver,
regardless of your operating system.

### Starting IE

{% highlight ruby %}
b = Watir::Browser.new :ie
{% endhighlight %}

### Configuring IE

Internet Explorer is Windows only and only works if you ensure that Protected Mode settings for each zone are set to the same value.
Additional set up suggestions can be found [here](https://github.com/SeleniumHQ/selenium/wiki/InternetExplorerDriver#required-configuration)

### Internet Explorer Options

*Note: this documentation has been updated for Watir 6.19, and is focused on
supporting the updates made for Selenium 4.*

For non-browser capabilities take a look at our [Capabilities Guide](../capabilities)
Watir uses your standard IE settings and config, so you can manually adjust IE to how you want it before running your tests,
and it will pick up these settings.

Watir will build the options for you when you pass in a Hash that is based on
[Selenium's `IE::Options` class](https://github.com/SeleniumHQ/selenium/blob/trunk/rb/lib/selenium/webdriver/ie/options.rb).
That is where you will find documentation for the various things that can 
be adjusted programatically by Watir for your test execution.

Commonly used settings include:
* :args           
* :element_scroll_behavior
* :full_page_screenshot
* :ensure_clean_session
* :ignore_protected_mode_settings
* :ignore_zoom_level
* :initial_browser_url
* :persistent_hover
* :require_window_focus

{% highlight ruby %}
args = ["--log-level=DEBUG", "--log-file=/foo"]
Watir::Browser.new :ie, options: {args: args}
{% endhighlight %}

<!--- TODO: Link to other guides with browser specific info --->
