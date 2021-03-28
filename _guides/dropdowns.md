---
layout: guide
title: Dropdown Elements
permalink: /guides/dropdowns/
modified_date: 2021-03-28
---

### Overview
Dropdowns are comprised of two element types:
[`Watir::Select`](https://rdoc.info/gems/watir/Watir/Select) and
[`Watir::Option`](https://rdoc.info/gems/watir/Watir/Option)

These are accessed by calling `Browser#select` or `Browser#select_list`.
Creating a `SelectCollection` is accomplished with `Browser#selects` or `Browser#select_lists`, 
and an `OptionColection` by `Browser#options` or `Select#options`.
For all of the different ways of locating a `Select` element,
take a look at our [Locating Elements Guide](../locating).

Note that `Option` elements should generally be accessed via a `Select` element instance.

[Browser Drivers](../drivers) treat `Option` elements differently than other elements.
They are the only element type that does not need to be displayed on the page in order to
click them. That means you do not have to first click the `Select` element to use it.

Note that there are a many Dropdown implementation that combine JavaScript with
non-standard elements to achieve this affect. Because these elements are not 
handled in the same way as Option and Select elements, they can not be treated 
as Dropdowns by Watir. 

`Select` and `Option` elements also inherit methods from standard [Web Elements](../elements)

### Common or Special Methods
* [`Select#include?`](https://rdoc.info/gems/watir/Watir/Select#include%3F-instance_method)
* [`Select#select`](https://rdoc.info/gems/watir/Watir/Select#select-instance_method)
* [`Select#text`](https://rdoc.info/gems/watir/Watir/Select#text-instance_method)
* [`Select#value`](https://rdoc.info/gems/watir/Watir/Select#value-instance_method)
* [`Select#clear`](https://rdoc.info/gems/watir/Watir/Select#clear-instance_method) - this only applies if the checklist has a `multiple` attribute

### Standard Setter Interface

This functionality was added in Watir 7 beta 2.

`Select#set` is an alias of `#select`. It takes a number of different argument types:
* When the first parameter value is a `String` or a `Regexp`, Watir will select the first
`Option` that matches by `value`, `text` or `label` attributes.
* When the first parameter is a value is a `Numeric`, Watir will convert it to a String
and select the first `Option` that matches by value, text or label.
* When the `:value`, `:text` or `:label` keywords are used, Watir will select the first
  `Option` that matches on that particular attribute.
* When an `Array` or multiple parameters are passed in, Watir treats the `Select` object
as having the attribute `multiple`, and will select every `Option` that matches each value
  in the `Array` by `value`, `text` or `label` attributes.
  
### Example

{% highlight ruby %}
browser = Watir::Browser.start 'watir.com/examples/simple_form.html'

# Non-Multiple Select List
country_dropdown = browser.select(id: 'country')
country_dropdown.text == 'select your country' # => true
country_dropdown.include? '1' # => true
country_dropdown.include? 'Sweden' # => true
country_dropdown.select /en/
country_dropdown.value == '1' # => true
country_dropdown.select(text: 'Denmark')
country_dropdown.selected?('Denmark') == true # => true
country_dropdown.select(text: 'Denmark')
country_dropdown.selected?('1') == true # => true
country_dropdown.select(value: '2')
country_dropdown.selected?('Norway') == true # => true
country_dropdown.select(label: 'Sverige')
country_dropdown.selected?('Sweden') == true # => true

# Multiple Select List
country_dropdown = browser.select(id: 'languages')
country_dropdown.text == 'EN' # => true (first matching option)
country_dropdown.clear
country_dropdown.text.nil? # => true
country_dropdown.select /an/ # Not an Array, so only first matching selected
country_dropdown.value == '1' # => true
country_dropdown.selected?('3') == false # => true 
country_dropdown.select [/an/] # An Array, so only first matching selected
country_dropdown.value == '1' # => true (value of first selected)
country_dropdown.selected?('3') == true # => true (all matching selected)

browser.close
{% endhighlight %}
