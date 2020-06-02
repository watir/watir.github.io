---
layout: guide
title: Cookies
permalink: /guides/cookies/
redirect_from: /docs/cookies/
---

The biggest "gotcha" when working with cookies is that you need to actually be on the domain
for which you want to interact with the cookies.
    
{% highlight ruby %}
browser = Watir::Browser.new
browser.goto 'example.com'

# Add
browser.cookies.add 'foo', 'bar', path: '/path', expires: (Time.now + 10000), secure: true

# List (wrong path)
browser.cookies.to_a # => []

# List (right path)
browser.goto 'example.com/path'
browser.cookies.to_a

# Save to File
browser.cookies.save '.cookies'

# Delete specific cookie
browser.cookies.delete 'foo'

# Load from a File
browser.cookies.load '.cookies'

# Delete All cookies
browser.cookies.clear
{% endhighlight %}
