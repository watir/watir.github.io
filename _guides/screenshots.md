---
layout: guide
title: Screenshots
permalink: /guides/screenshots/
redirect_from: /docs/screenshots/
---

<!--- TODO: Add info about Screenshot-stitch --->

Watir has a pretty awesome screenshot capability, built right in.

{% highlight ruby %}
# Save screenshot to file
browser.screenshot.save 'screenshot.png'

# Represent screenshot as PNG image string
browser.screenshot.png

# Represent screenshot as Base64 encoded string
browser.screenshot.base64
{% endhighlight %}

If you’re using Cucumber also, you can easily embed this in your html report output by adding the following to your env.rb file:

{% highlight ruby %}
After do |_scenario|
  browser.screenshot.save 'screenshot.png'
  embed 'screenshot.png', 'image/png'
end
{% endhighlight %}
