---
layout: guide
title: Basic Browser Authentication
permalink: /guides/authentication/
redirect_from: /docs/authentication/
---

The easiest and most elegant way to handle [basic browser authentication](http://en.wikipedia.org/wiki/Basic_access_authentication) 
is to supply the username and password in the URL, bypassing the dialog altogether.

{% highlight ruby %}
b = Watir::Browser.start 'http://admin:password@yourwebsite.com'
{% endhighlight %}

### Proxy Authentication

If the above method doesn’t work, eg. you are authenticating against a NTLM proxy, you may have find using 
the [AutoAuth Firefox extension](https://addons.mozilla.org/en-us/firefox/addon/autoauth/) will enable you 
to automatically dismiss this dialog with your credentials. 
See [this blog post](http://watirmelon.com/2012/06/27/automatic-firefox-authentication-when-using-selenium-webdriver-with-autoauth/) for full details.
