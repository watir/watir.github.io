---
layout: guide
title: Web Elements
permalink: /guides/elements/
redirect_from: /docs/elements/
modified_date: 2021-03-28
---

Watir automatically generates classes and methods for all HTML5.1 and SVG2 supported elements and 
their associated attributes. These classes leverage encapsulation to provide access to their 
specific attributes, making them easier to locate and use.

You can see an example of filling out a form in our [Example Code](../form-example)

### Overview
[`Watir::Element`](https://rdoc.info/gems/watir/Watir/Element) is the superclass
that all other Element types inherit from. All Elements have these behaviors.

It is accessed by calling `Browser#element`.
Creating an `ElementCollection` is accomplished with `Browser#elements`.
For all of the different ways of locating an `Element`,
take a look at our [Locating Elements Guide](../locating).

***You are discouraged from using this class directly***,
and use the correct subclass for the element type you are using.

### Common Methods
* [`#click`](https://rdoc.info/gems/watir/Watir/Element#click-instance_method)
* [`#text`](https://rdoc.info/gems/watir/Watir/Element#text-instance_method)
* [`#present?`](https://rdoc.info/gems/watir/Watir/Element#present%3F-instance_method)
* [`#attribute`](https://rdoc.info/gems/watir/Watir/Element#attribute-instance_method)

### Standard Setter Interface

This functionality was fully implemented in Watir 7 beta 2.

One of the coolest features implemented by Page Object gems is the ability to use Watir to automatically
fill out a form based on Element type. As of Watir 7.0, every element will respond to `#set` and take
an argument that ensures that the correct action will be taken for that element. Many of the element
subclasses in the following section will take a specific obvious action 
(follow the links below to learn what they are).
If the subclass isn't specified, though, Watir will use `Element#set` to determine what kind of element
it is and take the desired action based on that.

### Example

{% highlight ruby %}
browser = Watir::Browser.start 'watir.com/examples/simple_form.html'

header = browser.element(id: 'user')
header.present? # => true
header.text == 'Add user' # => true
header.attribute('data-test') == 'header' # => true
header.click

browser.close
{% endhighlight %}

### Special Handling of Specific Elements

* [Buttons (Button)](../buttons)
* [CheckBoxes (CheckBox)](../checkboxes)
* [Dropdowns (Select & Option)](../dropdowns)
* [Frames (Frame & IFrame)](../frames)
* [Links (Anchor)](../links)
* [Radio Buttons (Radio & RadioSet)](../radios)
* [Text Inputs (TextField & TextArea & WYSIWYG)](../text_inputs)

[comment]: <> (* Date and Time &#40;DateField & DateTimeField&#41;)

[comment]: <> (* File Fields &#40;FileField&#41;)

[comment]: <> (* Forms &#40;Form & Input&#41;)

[comment]: <> (* Images &#40;Image&#41;)

[comment]: <> (* Lists &#40;List&#41;)

[comment]: <> (* Tables &#40;Table, TableCell, TableRow, TableSection, Row, Cell&#41;)

