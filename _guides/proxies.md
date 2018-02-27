---
layout: guide
title: Browser Proxies
permalink: /guides/proxies/
redirect_from: /docs/proxies/
---

In many cases, you can specify a proxy to use with the `proxy: {}` option. While each browser driver handles this slightly differently, the following format works in Chrome or Firefox.

### Example: using a proxy in Chrome or Firefox

{% highlight ruby %}
require 'watir'

proxy = {
  http: 'my.proxy.com:8080',
  ssl:  'my.proxy.com:8080'
}

firefox_browser = Watir::Browser.new :firefox, proxy: proxy

remote_firefox  = Watir::Browser.new :firefox, url: REMOTE_SELENIUM, proxy: proxy

chrome_browser  = Watir::Browser.new :chrome, proxy: proxy

remote_chrome   = Watir::Browser.new :chrome, url: REMOTE_SELENIUM, proxy: proxy
{% endhighlight %}

Be sure to specify both `:http` and `:ssl` to route both types of traffic through your proxy.

Under the hood, this is passing options to create a `Selenium::WebDriver::Proxy` object.

### Example: setting a http and https proxy for Remote Chrome

{% highlight ruby %}
proxy = 'my.proxy.com:8080'
browser = Watir::Browser.new :chrome, url: REMOTE_URL, proxy: {http: proxy, ssl: proxy}
{% endhighlight %}

