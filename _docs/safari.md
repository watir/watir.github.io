---
layout: page
title: Safari
permalink: /docs/safari/
---

Watir-WebDriver supports Safari thanks to the release of [SafariDriver](http://code.google.com/p/selenium/wiki/SafariDriver).

The downside is the set up is quite lengthy at the moment as it requires a Safari extension (version 5+) and until someone publishes the extension to the online gallery, you’ll have to build it yourself.

### Steps to build the extension

1. First, [create and install a Safari extension](https://developer.apple.com/certificates/index.action) certificate at Apple. You’ll need to sign up for a (free) Safari developer account, and download your certificate locally.

2. Now, you’ll need to build the extension. First, you’ll need to check out the selenium source code to do so:

{% highlight bash %}
svn co http://selenium.googlecode.com/svn/trunk selenium
{% endhighlight %}

3. Then change into this directory and build the extension

{% highlight bash %}
cd selenium
./go safari
{% endhighlight %}

4. Finally, install your extension:
  * Launch Safari
  * Ensure develop menu is shown by setting it in Advanced Preferences
  * Open the Extension Builder (Develop > Show Extension Builder)
  * Add your new extension from:
    {% highlight bash %}
    $SELENIUM_CHECKOUT_LOCATION/build/javascript/safari-driver/SafariDriver.safariextension
    {% endhighlight %}

### Using Safari with Watir-WebDriver

It’s exactly the same as any other browser:

{% highlight ruby %}
require 'watir'
b = Watir::Browser.new :safari
{% endhighlight %}

### Caveat Emptor

* browser.execute_script is a little flaky
* Can’t use local html files as extensions don’t load
* Can’t perform browser file uploads at present
* Not sure how to configure browser options programatically like user agent strings
