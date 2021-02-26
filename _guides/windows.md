---
layout: guide
title: Browser Windows
permalink: /guides/windows/
redirect_from: /docs/windows/
---

When a new browser window is opened, you need to switch over to it in order to interact
with it.

### Simple Switch

The vast majority of the time, there is only one other window you want to use, so,
as of Watir 6.18, the easiest way to work with that window is with `Browser#switch_window`.
It can only be used if there are only 2 windows, and all it does is switch to the other one,
no additional locating required. Just don't forget to switch back when you need to.

{% highlight ruby %}
browser.switch_window
browser.button(id: 'close').click
browser.switch_window
{% endhighlight %}

### Window Location

If you need to work with more than one window, or want more control than `#switch_window`,
then you need to be able to specify which window to work with.

There are 3 primary selectors for windows:
1. `:title` &nbsp;&nbsp;&nbsp; - typically the easiest
2. `:url` &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - often used with a `Regexp` value (see example below)
3. `:element` - a unique element might be the least brittle (new as of Watir 6.18!)

{% highlight ruby %}
browser.window(title: 'new window')
browser.window(url: /my_page\.html/)
browser.window(element: browser.div(id: 'my-element'))
{% endhighlight %}

#### Locating by index is no longer supported

The WebDriver specification does not require drivers to provide the list of 
open windows in any particular order.
Since early versions of Watir, many users have `browser.widows.last` or `browser.window(index: -1)`
in their code to indicate "the most recently opened browser." Since that is not always
the case (especially with both Safari & Internet Explorer). For Watir 7 we're removing support
for both `:index` as a locator as well as indexing from `Browser#windows`. 
Most of the time, `Browser#switch_window` will be good enough,
and for the times when it isn't, you'll need to use one of the other 3 locators.

### Window Usage

Once you've specified the window you want to use, you need to switch over to it.
This is done with the `#use` method and can be accomplished either with or without a block.
When using without a block, you might also use the `Browser#original_window`
method that was introduced in Watir 6.7.

{% highlight ruby %}
browser.window(title: 'new window').use
browser.button(id: 'close').click
browser.original_window.use
{% endhighlight %}

When using a block to interact with the window, Watir will automatically switch
back to the window you started on.
{% highlight ruby %}
browser.window(title: 'new window').use {
  browser.button(id: 'close').click
}
{% endhighlight %}

### Window Waiting

A common issue when working with windows is that they take time to load,
so synchronization has been notoriously difficult. As of Watir 6.18,
all of the power of Watir's waiting functionality is available to window collections.
For example, you can synchronize by waiting for a specific number of windows:

{% highlight ruby %}
browser.link(id: 'create-new-window).click
browser.windows.wait_until(size: 2)
browser.switch_window
{% endhighlight %}

See the [Window Switching Spec](https://github.com/watir/watirspec/blob/master/window_switching_spec.rb) 
for more examples of working with windows.
