---
layout: page
title: Javascript Dialogs
permalink: /docs/javascript-dialogs/
---

JavaScript dialogs are fairly common in web applications.

Watir-WebDriver has an inbuilt library for handling the dialogs, and capturing values from the dialogs.

### Javascript Alerts

{% highlight ruby %}
# Check if alert is shown
browser.alert.exists?

# Get text of alert
browser.alert.text

# Close alert
browser.alert.ok
browser.alert.close
{% endhighlight %}

### Javascript Confirms

{% highlight ruby %}
# Accept confirm
browser.alert.ok

# Cancel confirm
browser.alert.close
{% endhighlight %}

### Javascript Prompt

{% highlight ruby %}
# Enter text to prompt
browser.alert.set 'Prompt answer'

# Accept prompt
browser.alert.ok

# Cancel prompt
browser.alert.close
{% endhighlight %}

### Alternative Method

If you’re having trouble using the above method, you can override the JavaScript functions to return the value you want, so when they’re meant to show, they don’t!

{% highlight ruby %}
# don't return anything for alert
browser.execute_script('window.alert = function() {}')

# return some string for prompt to simulate user entering it
browser.execute_script("window.prompt = function() {return 'my name'}")

# return null for prompt to simulate clicking Cancel
browser.execute_script('window.prompt = function() {return null}')

# return true for confirm to simulate clicking OK
browser.execute_script('window.confirm = function() {return true}')

# return false for confirm to simulate clicking Cancel
browser.execute_script('window.confirm = function() {return false}')

# don't return anything for leave page popup
browser.execute_script('window.onbeforeunload = null')
{% endhighlight %}
