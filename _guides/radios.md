---
layout: guide
title: Radio Button Elements
permalink: /guides/radios/
modified_date: 2021-03-28
---

### Overview

Radios can be interacted with by either
[`Watir::Radio`](https://rdoc.info/gems/watir/Watir/Radio) or
[`Watir::RadioSet`](https://rdoc.info/gems/watir/Watir/RadioSet).
(`RadioSet` was added in Watir 6.8)

These are accessed by calling `Browser#radio` or `Browser#radio_set`, respectively.
Creating a `RadioCollection` is accomplished with `Browser#radios`, but you should
always prefer working with a `RadioSet`.
For all of the different ways of locating a `Radio` element,
take a look at our [Locating Elements Guide](../locating).
A `RadioSet` is located by passing in a valid locator for any
of the `Radio` elements included in the `RadioSet` (so often using the `:name` attribute locator).

Radio Buttons are special because only one button within a form
with a specific name can be selected at a time. You can either identify the
specific Radio button you want and interact with it, or you
can identify the entire group with RadioSet and select the one you want by value or text.

They also inherit methods from standard [Web Elements](../elements)

### Common or Special Methods

* [`Radio#select`](https://rdoc.info/gems/watir/Watir/Radio#select-instance_method)
* [`Radio#selected?`](https://rdoc.info/gems/watir/Watir/Radio#selected%3F-instance_method)
* [`Radio#text`](https://rdoc.info/gems/watir/Watir/Radio#text-instance_method)

* [`RadioSet#selected`](https://rdoc.info/gems/watir/Watir/RadioSet#selected-instance_method)
* [`RadioSet#selected?`](https://rdoc.info/gems/watir/Watir/RadioSet#selected%3F-instance_method)
* [`RadioSet#select`](https://rdoc.info/gems/watir/Watir/RadioSet#select-instance_method)
* [`RadioSet#text`](https://rdoc.info/gems/watir/Watir/RadioSet#text-instance_method)
* [`RadioSet#value`](https://rdoc.info/gems/watir/Watir/RadioSet#value-instance_method)

### Standard Setter Interface

This functionality was added in Watir 7 beta 2.

`Radio#set` is the same behavior as the superclass `Element`; if no arguments are passed
or `true` is passed, it will click the link. 
`RadioSet#set` is an alias of `#select`. It takes a `String` or a `Regexp` argument. 
Watir will select the first `Radio` that matches by `value`, `text` or `label` attributes.

### Example

{% highlight ruby %}
browser = Watir::Browser.start 'watir.com/examples/simple_form.html'

radio_no_newsletter = browser.radio(id: 'newsletter_no')
radio_no_newsletter.text == 'No' # => true
radio_no_newsletter.selected? == false # => true
radio_no_newsletter.select(false)
radio_no_newsletter.selected? == false # => true
radio_no_newsletter.select
radio_no_newsletter.selected? == true # => true
radio_no_newsletter.select(true)
radio_no_newsletter.selected? == true # => true
radio_no_newsletter.select(false) # (can't unselect a radio button so this is ignored)
radio_no_newsletter.selected? == true # => true

radioset = browser.radio_set(name: 'newsletter')
radioset.select('Yes')
radioset.selected.is_a?(Watir::Radio) # => true
radioset.selected?('No') == false # => true
radioset.text == 'Yes' # => true
radioset.value == 'yes' # => true

browser.close
{% endhighlight %}
