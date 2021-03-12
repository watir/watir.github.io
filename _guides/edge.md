---
layout: guide
title: Microsoft Edge
permalink: /guides/edge/
redirect_from: /docs/edge/
modified_date: 2021-03-12
---

### MSEdgeDriver

To use Edge, ensure you're [using the appropriate driver](../drivers)

Between the final release of Selenium 3 and the initial release of Selenium 4,
Microsoft completely changed their browser engine. As such, Selenium 3 only works
  with the Legacy EdgeHTML browser, and Selenium 4 only works with the new
  Chromium backed Edge browser (v75+). As such, Edge support requires Watir 6.19+
  and Selenium 4.0.0beta1 or newer.

### Starting Edge

{% highlight ruby %}
b = Watir::Browser.new :edge
{% endhighlight %}

### Edge Options

For non-browser specific capabilities take a look at our [Capabilities Guide](../capabilities)
In addition to those, all browser settings that are available for [Chrome](../chrome)
are also available for Edge.

Watir will build the options for you when you pass in a Hash that is based on
[Selenium's `Edge::Options` class](https://github.com/SeleniumHQ/selenium/blob/trunk/rb/lib/selenium/webdriver/edge/options.rb)

Commonly used settings include:
* :args - an Array of command-line arguments to use when starting Chrome
* :binary - a String representing the Path to the Chrome Browser executable to use
* :prefs - a Hash with each entry consisting of the name of the preference and its value
* :extensions - an Array of Strings listing the paths to (.crx) Chrome extensions to install on startup
* :emulation -  A Hash for [raw emulation options](http://chromedriver.chromium.org/mobile-emulation).
  (*it is important to note that the key must be `:emulation`, not `:mobile_emulation`*)

  