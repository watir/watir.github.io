---
layout: guide
title: Button Elements
permalink: /guides/buttons/
modified_date: 2021-03-28
---

### Overview

[`Watir::Button`](https://rdoc.info/gems/watir/Watir/Button)
describes elements that either have a tag name of
`button` or are an `Input` element that have a `type` attribute
value of `button`.

It is accessed by calling `Browser#button`.
Creating a `ButtonCollection` is accomplished with `Browser#buttons`.
For all of the different ways of locating a `Button` element, 
take a look at our [Locating Elements Guide](../locating).

Selenium does not care if you click a Button that is disabled, but Selenium
will automatically wait for it to become enabled, because a tester
shouldn't need to click a disabled button.

Buttons also inherit methods from standard [Web Elements](../elements)

### Common or Special Methods

* [`Element#text`](https://rdoc.info/gems/watir/Watir/Button#text-instance_method)- 
  because it returns input value or button element text depending on which `Button` type.

### Standard Setter Interface

This functionality was added in Watir 7 beta 2.

`Button#set` takes a boolean argument. Watir clicks the element if the value
is `true` and does nothing if the value is `false`.

### Example

{% highlight ruby %}
browser = Watir::Browser.start 'watir.com/examples/simple_form.html'

button = browser.button(value: 'Submit')
button.text == 'Submit' # => true
button.click

browser.close
{% endhighlight %}

