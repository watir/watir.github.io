---
layout: guide
title: Waiting
permalink: /guides/waiting/
redirect_from: /docs/waiting/
---

Waiting is usually problematic when you have dynamic web interfaces, eg. web sites that have lots of AJAX.

### Explicit waits

There are four built in methods that you can use to make your waiting experience more pleasant (and remove those evil sleep statements from your code)

* <code>Watir::Wait.until { ... }</code> where you can wait for a block to be true
* <code>object.set</code> where you can do something when it’s present
* <code>object.wait_until_present</code> where you just wait until something is present
* <code>object.wait_while_present</code> where you just wait until something disappears
* The default timeout for all these methods is 30 seconds, but your can pass an argument to any of these to increase (or decrease) it as needed.

{% highlight ruby %}
require 'watir'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
b.text_field(id: 'entry_1000000').set 'your name'
b.select_list(id: 'entry_1000001').wait_until_present
b.select_list(id: 'entry_1000001').select('Ruby')
b.button(value: 'Submit').click
b.button(value: 'Submit').wait_while_present
Watir::Wait.until { b.text.include? 'Thank you' }
{% endhighlight %}

### Implicit waits

As an alternative, you can use the WebDriver’s implicit waits to specify a maximum time (in seconds) the script will try to find an element before timing out. This is done by setting the property of the underlying driver:

{% highlight ruby %}
require 'watir'
b = Watir::Browser.new
b.driver.manage.timeouts.implicit_wait = 3 # 3 seconds
# Note that using implicit waits can make your tests slower
# and more difficult to understand when they fail.
{% endhighlight %}
