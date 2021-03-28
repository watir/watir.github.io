---
layout: guide
title: Link Elements
permalink: /guides/links/
modified_date: 2021-03-28
---

### Overview

[`Watir::Anchor`](https://rdoc.info/gems/watir/Watir/Anchor)

It is accessed by calling either `Browser#a` or `Browser#link`.
Creating an `AnchorCollection` is accomplished with either `Browser#as` or `Browser#links`.
For all of the different ways of locating an `Anchor` element,
take a look at our [Locating Elements Guide](../locating).

They also inherit methods from standard [Web Elements](../elements)

### Common or Special Methods

* [`Anchor#href`](https://rdoc.info/gems/watir/Watir/Anchor#href-instance_method)

### Standard Setter Interface

This functionality was added in Watir 7 beta 2.

`Anchor#set` is the same behavior as the superclass `Element`; if no arguments are passed
or `true` is passed, it will click the link.

### Example

{% highlight ruby %}
browser = Watir::Browser.start 'watir.com'

link = browser.link(href: /guides/)
link.href == 'http://watir.com/guides/' # => true
link.click

browser.close
{% endhighlight %}
