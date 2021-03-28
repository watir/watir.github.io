---
layout: guide
title: CheckBox Elements
permalink: /guides/checkboxes/
modified_date: 2021-03-28
---

### Overview

[`Watir::CheckBox`](https://rdoc.info/gems/watir/Watir/CheckBox)
is a very straightforward element that can be toggled on and off
without many restrictions. Watir ensures it is enabled before clicking.

It is accessed by calling `Browser#checkbox`.
Creating a `CheckBoxCollection` is accomplished with `Browser#checkboxes`.
For all of the different ways of locating a `CheckBox` element,
take a look at our [Locating Elements Guide](../locating).

Checkboxes also inherit methods from standard [Web Elements](../elements)

### Common or Special Methods

* [`CheckBox#check`](https://rdoc.info/gems/watir/Watir/CheckBox#check-instance_method)
* [`CheckBox#checked?`](https://rdoc.info/gems/watir/Watir/CheckBox#checked%3F-instance_method)
* [`CheckBox#clear`](https://rdoc.info/gems/watir/Watir/CheckBox#clear-instance_method)

### Standard Setter Interface

[`CheckBox#set`](https://rdoc.info/gems/watir/Watir/CheckBox#set-instance_method) 
is an alias of `check` and takes a boolean argument. 
When the value is `true`, Watir ensures that the element is checked. 
When the value is `false`, Watir ensures that the element is not checked.

### Example

{% highlight ruby %}
browser = Watir::Browser.start 'watir.com/examples/simple_form.html'

checkbox = browser.checkbox(id: 'interests_cars')
checkbox.checked? == false # => true
checkbox.check
checkbox.checked? == true # => true
checkbox.check
checkbox.checked? == true # => true
checkbox.clear
checkbox.checked? == false # => false

browser.close
{% endhighlight %}
