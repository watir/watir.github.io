---
layout: guide
title: Browser Popups
permalink: /guides/windows/
redirect_from: /docs/windows/
---

<!--- TODO: Add more examples to this Guide  --->
<!--- TODO: Original Window Method from Watir 6.7  --->

When a new browser window is opened, you can then ‘use’ the new window.

{% highlight ruby %}
browser.window(title: 'annoying popup').use do
  browser.button(id: 'close').click
end
{% endhighlight %}

See the [Window Switching Spec](https://github.com/watir/watirspec/blob/master/window_switching_spec.rb) for more examples.
