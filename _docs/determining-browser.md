---
layout: docs
title: Determining Browser
permalink: /docs/determining-browser/
---

You may want to determine which browser you are running in your Watir-WebDriver code.

It’s simple to do:

{% highlight ruby %}
require 'watir-webdriver'
b = Watir::Browser.new :chrome
browser.driver.browser #=> :chrome
{% endhighlight %}
