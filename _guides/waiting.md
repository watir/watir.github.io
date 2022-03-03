---
layout: guide
title: Waiting
permalink: /guides/waiting/
redirect_from: /docs/waiting/
---

Properly synchronizing your code with the state of the browser has long been the biggest issue testers face
when testing a dynamic website.

### Sleeps

It is often discussed that hard coding `#sleep` is a bad practice. 
Besides being an indication that your test suite doesn't have sufficient maturity, there are specific technical
frustrations that come with hard coding sleeps. The biggest issue is that you are having to balance the concern
of how long is long enough with having an additional and typically unnecessary set of 30 second sleeps 
scattered everywhere throughout your code.

### Selenium Waits - Implicit & Explicit

Selenium has two approaches to synchronization. The first is "implicit wait." Presumably this feature
was inspired by the early versions of Watir which did a better job of automatically waiting for elements. 
Using implicit waits
 means telling the driver to apply a global value for how long to wait when attempting to locate an element if
 it can't find the element. The idea behind implicit waits is good, but there are two main issues with this 
 form of implementation, so Watir does not recommend and does not provide direct access for setting them.
 
 * The wait happens during the locate instead of when trying to act on the element. This makes it impossible
 to immediately query the state of an element before it is there.
 * Implicit waits by themselves will not be sufficient to handle all of the synchronization issues in your code.
 The combination of delegating waiting responsibilities to the driver and leveraging polling in the code
  (explicit waits) can cause weirdness that is difficult to debug.

The second and recommended approach to waiting in Selenium is to use explicit waits. This retains responsibility
 for synchronization with your code. In this approach your code will continuously check to see if the supplied
 condition is met, and continue with the next piece of the code when so. Watir waiting approaches all leverage
 this idea of polling for the desired output from a supplied condition

### When Present and When Enabled

Prior to Watir 6.0, the best way to ensure that the code waited for the browser to be ready was to insert a 
`#when_present` or `#when_enabled` method before the action.

{% highlight ruby %}
browser.text_field(title: 'Search').when_present.set 'Hello World!'
{% endhighlight %}

The problem here is that you should never be using `#set` if you aren't sure the element will be there or
enabled, so these `#when_present` calls are philosophically redundant.

As such, Watir 6.0 deprecated `#when_present` and `#when_enabled` and every action call on an element
 effectively executes this logic by default.

Note that Watir does its automatic waiting when taking actions, not when attempting to locate. This provides
additional flexibility for querying the state of an element without needing unnecessary waits.

### Watir Wait and Waitable Modules

`Waitable` is the module that is included by `Browser`, `Alert`, `Window` and `Element`.
This module provides access to two main methods: `#wait_until` and `#wait_while`. As of Watir 6, both of these methods
accept `:timeout`, `:message` keyword parameters. Note that the `:interval` keyword was added in Watir 6.1 to 
allow reducing how often the condition is polled, and as of Watir 6.12 you can use a `Proc` instance value for 
`:message` if that is preferred to a `String`). Then as always, a block is passed in to establish what
condition needs to be met. `#wait_until` will execute the block until a truthy result is returned, and
`#wait_while` will execute the block until a falsy result is returned.

{% highlight ruby %}
browser.wait_until { |b| b.title == "Foo" }
browser.window(title: "Foo").wait_while(&:exists?)
browser.alert.wait_until { |a| a.text == "foo" }
browser.button(name: 'submit').wait_until(&:enabled?)
{% endhighlight %}

Note that it is encouraged to use `#to_proc` syntax when possible:

{% highlight ruby %}
# Good
browser.text_field(title: 'Search').wait_until(message: "Can't find it" &:present?)

# Less Good
browser.text_field(title: 'Search').wait_until(message: "Can't find it") { |el| el.present? }
{% endhighlight %}

The default timeout for Watir's Waits is 30 seconds. You can pass in the `:timeout` keyword parameter to 
any of the wait methods, or you can change the global default with:
{% highlight ruby %}
Watir.default_timeout = 60
{% endhighlight %}

### Wait Until Present and Wait While Present

As of 6.15 `#wait_while_present` and `#wait_until_present` are deprecated. For versions 6.2 through 6.14
these methods had subtly different behavior from `.wait_until(&:present?)` & `.wait_while(&:present?)`.
This is no longer the case and these methods should no longer be used.
