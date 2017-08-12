---
layout: article
title: Headless
permalink: /articles/headless/
redirect_from: /docs/headless/
---

The headless gem is a ruby wrapper for Xvfb that makes it super easy to run graphical applications (such as real web browsers) on a headless Linux machine. This gem is perfect for running headless Watir-WebDriver tests using a real browser.

### An Example

{% highlight ruby %}
require 'watir'
require 'headless'
headless = Headless.new
headless.start
b = Watir::Browser.start 'www.google.com'
puts b.title
b.close
headless.destroy
{% endhighlight %}

### A Cucumber Example

You should add the following code to your env.rb file:

{% highlight ruby %}
if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
end
{% endhighlight %}
