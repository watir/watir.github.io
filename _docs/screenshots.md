---
layout: page
title: Screenshots
permalink: /docs/screenshots/
---

Watir-WebDriver has a pretty awesome screenshot capability, built right in.

{% highlight ruby %}
# Save screenshot to file
browser.screenshot.save 'screenshot.png'

# Represent screenshot as PNG image string
browser.screenshot.png

# Represent screenshot as Base64 encoded string
browser.screenshot.base64
{% endhighlight %}

The great thing about this is it gives you a screen shot of the entire page, not just above the fold.

If you’re using Cucumber also, you can easily embed this in your html report output by adding the following to your env.rb file:

{% highlight ruby %}
After do |_scenario|
  browser.screenshot.save 'screenshot.png'
  embed 'screenshot.png', 'image/png'
end
{% endhighlight %}
