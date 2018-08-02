---
layout: guide
title: Headless
permalink: /guides/headless/
redirect_from: /docs/headless/
---

There are several options for running your tests headlessly. The first thing to consider is whether
you actually need to run headless. Most options for this have limitations and require trade-offs.

Traditionally PhantomJS has been an option for running headlessly. The driver for this virtual browser
has been deprecated, though, so it is no longer supported in Watir.

Perhaps the best option for running headlessly is using the Headless gem. The biggest limitation
for this is that it only works on Unix based systems. It is the actual browser run in a virtual
GUI. This is a great option for using a real world browser, albeit on a minimally used platform.

### Headless gem

Code for the before hook:

{% highlight ruby %}
require 'watir'
require 'headless'

headless = Headless.new
headless.start
{% endhighlight %}

Code for the after hook:
{% highlight ruby %}
headless.destroy
{% endhighlight %}


### Browser specific options

<!--- TODO: Move this section from browsers to here --->

Both Chrome and Firefox have implemented headless modes for their browsers that work on all platforms.
Recognize that this option does not include all of the browser code, so not all of the browser features
are implemented, and this will not be an exact replication of what a user will see in a real browser.

[Headless on Chrome](/guides/firefox/#headless)

[Headless on Firefox](/guides/firefox/#headless)
