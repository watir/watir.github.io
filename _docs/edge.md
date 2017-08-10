---
layout: page
title: Microsoft Edge
permalink: /docs/safari/
---

### Microsoft WebDriver

To use Edge, ensure you're [using the appropriate driver](../docs/drivers)

* Microsoft's WebDriver is still under active development, so there are a number of
things that aren't implemented relative to what is available on other browsers.

* If you are using a Windows 10 Insider Edition, ensure that your driver version 
matches your Windows Build number

### Starting Edge

{% highlight ruby %}
b = Watir::Browser.new :edge
{% endhighlight %}
