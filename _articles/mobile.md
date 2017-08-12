---
layout: article
title: Mobile Devices
permalink: /articles/mobile/
redirect_from: /docs/mobile/
---

There are three options for using watir-webdriver to test mobile sites:

* Running tests against an embedded browser on a real device;
* Running tests against an embedded browser on a device emulator on a desktop machine; or
* Running tests against a desktop browser that is configured with the same resolution and user-agent credentials as a mobile browser.

Running against real and emulated devices (either iOS or Android) is both costly and is not as fast as using desktop browsers. There are documented details on setting up the iOS driver [here](http://code.google.com/p/selenium/wiki/IPhoneDriver) and Android [here](http://code.google.com/p/selenium/wiki/AndroidDriver). Using a real Apple device requires an Apple developer account which costs around $99.

A much easier and more efficient way is to use a desktop browser configured to mimic that of a mobile browser. This is extremely easy to do with the webdriver-user-agent gem:

{% highlight ruby %}
require 'watir'
require 'webdriver-user-agent'
driver = Webdriver::UserAgent.driver(browser: :chrome, agent: :iphone, orientation: :landscape)
browser = Watir::Browser.new driver
browser.goto 'tiffany.com'
browser.url.should == 'http://m.tiffany.com/International.aspx'
{% endhighlight %}

The gem currently supports firefox and chrome as desktop browsers, and iphone, ipad, android_phone, and android_tablet as devices; portrait and landscape orientations are also available.
