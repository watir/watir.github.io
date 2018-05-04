---
layout: guide
title: Measure Page Performance
permalink: /guides/performance/
redirect_from: /docs/performance/
---

The [Watir-Performance gem](http://rubygems.org/gems/watir-performance) aims to provide a set of navigation timing metrics for Watir actions using a [W3C page performance standard](http://w3c-test.org/webperf/specs/NavigationTiming/). This is a perfect solution to capture response time metrics, and it’s very straightforward to do.  Works in Chrome, Firefox, Edge and IE9 and up. Currently no Safari support.

{% highlight ruby %}
require 'watir'
require 'watir-performance'

10.times do
  b = Watir::Browser.new :chrome
  b.goto 'http://watir.com'
  load_secs = b.performance.summary[:response_time] / 1000
  puts "Load Time: #{load_secs} seconds."
  b.close
end
{% endhighlight %}

This produces something like:

{% highlight bash %}
Load Time: 3.701 seconds.
Load Time: 0.694 seconds.
Load Time: 1.874 seconds.
Load Time: 1.721 seconds.
Load Time: 2.096 seconds.
Load Time: 0.823 seconds.
Load Time: 2.362 seconds.
Load Time: 1.008 seconds.
Load Time: 1.761 seconds.
Load Time: 2.066 seconds.
{% endhighlight %}

List of available metric groupings

* :summary
* :navigation
* :memory
* :timing
