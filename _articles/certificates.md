---
layout: page
title: Browser Certificates
permalink: /articles/certificates/
redirect_from: /docs/certificates/
---

### Firefox

The Firefox driver properly handles untrusted certificates by default.

If you have a trusted certificate, but there is some other certificate error such as a hostname mismatch (eg. using a production certificate in test), you should do the following:

{% highlight ruby %}
profile = Selenium::WebDriver::Firefox::Profile.new
profile.assume_untrusted_certificate_issuer = false
b = Watir::Browser.new :firefox, profile: profile
{% endhighlight %}

The reason this is needed is explained [here](https://github.com/SeleniumHQ/selenium/wiki/Untrusted-SSL-Certificates#implementation-details).

### Chrome

It is easy to ignore invalid Browser certificates in Google Chrome by passing a command line switch:

{% highlight ruby %}
Watir::Browser.new :chrome, switches: ['--ignore-certificate-errors']
{% endhighlight %}
