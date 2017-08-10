---
layout: page
title: Browser Proxies
permalink: /docs/proxies/
---

### Example: setting a http and https proxy for Firefox

{% highlight ruby %}
profile = Selenium::WebDriver::Firefox::Profile.new
profile.proxy = Selenium::WebDriver::Proxy.new http: 'my.proxy.com:8080', ssl: 'my.proxy.com:8080'
browser = Watir::Browser.new :firefox, profile: profile
{% endhighlight %}

### Example: setting a http and https proxy for Chrome

{% highlight ruby %}
switches = '--proxy-server=my.proxy.com:8080'
browser = Watir::Browser.new :chrome, switches: switches
{% endhighlight %}
