---
layout: guide
title: Text Input Elements
permalink: /guides/text_inputs/
modified_date: 2021-03-28
---

### Overview

Text Inputs include: 
[`Watir::TextField`](https://rdoc.info/gems/watir/Watir/TextField) and
[`Watir::TextArea`](https://rdoc.info/gems/watir/Watir/TextArea).
Note that any `Input` element that does not define a `type` attribute is
considered to be a `TextField`.

These are accessed by calling `Browser#text_field` or `Browser#textarea`, respectively.
Creating a `TextFieldCollection` is accomplished with `Browser#text_fields`, 
and creating a `TextareaCollection` is accomplished with `Browser#textareas`,
For all of the different ways of locating a `TextField` or `TextArea` element,
take a look at our [Locating Elements Guide](../locating).

They also inherit methods from standard [Web Elements](../elements)

### Common or Special Methods

The first 3 are defined in [`Watir::UserEditable`](https://rdoc.info/gems/watir/Watir/UserEditable) module
* [`UserEditable#set`](https://rdoc.info/gems/watir/Watir/UserEditable#set-instance_method)
* [`UserEditable#clear`](https://rdoc.info/gems/watir/Watir/UserEditable#clear-instance_method)
* [`UserEditable#append`](https://rdoc.info/gems/watir/Watir/UserEditable#append-instance_method)
* [`Input#value`](https://rdoc.info/gems/watir/Watir/Input#value-instance_method)

### Standard Setter Interface

`TextField#set` and `TextArea#set` take a `String` argument.
Watir clears the field, then sends the provided keys to the element.

### Example

{% highlight ruby %}
browser = Watir::Browser.start 'watir.com/examples/simple_form.html'

text_field = browser.text_field(id: 'first_name')
text_field.set 'Luke'
text_field.value == 'Luke' # => true
text_field.append ' Perry'
text_field.value == 'Luke Perry' # => true
text_field.clear
text_field.value == '' # => true
text_field.append 'Luke'
text_field.value == 'Luke' # => true
text_field.set ' Perry'
text_field.value == ' Perry' # => true

browser.close
{% endhighlight %}

### WYSIWYG Editors

Most WYSIWYG Editors function by setting non-input elements to editable with
the attribute `content-editable`. See [WYSIWYG Editors](../wysiwyg) page for more information.
