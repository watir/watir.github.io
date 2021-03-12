---
layout: guide
title: Safari
permalink: /guides/safari/
redirect_from: /docs/safari/
modified_date: 2021-03-12
---

### SafariDriver

To use Safari, ensure you're [using the appropriate driver](../drivers)

* safaridriver requires using Safari 10+ on El Capitan or later OS.

* Note that of all the browser vendors, Apple's safari driver implementation 
  is the least compliant with the w3c standard. This means that there will
  be browser functionality that is working as intended but will not be 
  testable by your code.

* Since the  driver that ships with MacOS itself, it does not get updated very often, 
it is recommended that you download and use the 
  [Safari Technology Preview](https://developer.apple.com/safari/technology-preview/).
Note that this is only an option on MacOS.

* Before using safaridriver, turn on the Developer Menu by opening Safari preferences from the Menu Bar,
going to the Advanced tab, and ensuring that the Show Develop menu in menu bar checkbox is checked.

* Enable Remote Automation by selecting "Allow Remote Automation" in the Develop Menu in the Menu Bar.

* Authorize safaridriver to launch the webdriverd service which hosts the local web server. 
To permit this, run /usr/bin/safaridriver once manually and complete the authentication prompt.
  
### Starting Safari

{% highlight ruby %}
b = Watir::Browser.new :safari, technology_preview: true
{% endhighlight %}

### Safari Options
*Note: this documentation has been updated for Watir 6.19, and is focused on
supporting the updates made for Selenium 4.*

For non-browser specific capabilities take a look at our [Capabilities Guide](../capabilities)
In addition to those, there are
[a couple Safari specific settings](https://developer.apple.com/documentation/webkit/about_webdriver_for_safari#2957227)
that will change how Firefox operates during the test run.

Watir will build the options for you when you pass in a Hash that is based on
[Selenium's `Safari::Options` class](https://github.com/SeleniumHQ/selenium/blob/trunk/rb/lib/selenium/webdriver/safari/options.rb)

<!--- TODO: Link to other guides with browser specific info --->
