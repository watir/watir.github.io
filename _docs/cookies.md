---
layout: docs
title: Cookies
permalink: /docs/cookies/
---

There is a cookie API in Watir-WebDriver 0.5.2 onwards, that is easy to use.

{% highlight ruby %}
require 'watir-webdriver'
browser = Watir::Browser.new
browser.cookies.clear
browser.cookies.add 'foo', 'bar', :path => "/", :expires => 10.days.from_now, :secure => true
browser.cookies.delete 'foo'
browser.cookies.to_a
{% endhighlight %}
