---
layout: page
title: Safari
permalink: /docs/safari/
---

### SafariDriver

To use Safari, ensure you're [using the appropriate driver](../drivers)

* safaridriver requires using Safari 10 on either El Capitan or Sierra.

* Apple's safari driver is still under active development, so there are a number of
things that aren't implemented relative to what is available on other browsers.

* Since the  driver that ships with MacOS Sierra does not get updated very often, 
it is recommended that you download and use the [Safari Technology Preview](https://developer.apple.com/safari/technology-preview/).
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
