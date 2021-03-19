---
layout: guide
title: Locating Elements
permalink: /guides/locating/
redirect_from: /docs/locating/
modified_date: 2018-07-30
---

One of the most important features of Watir is the many varied ways it allows users to locate elements.
The Watir location API is designed to be easily read and understood by users (humans).
Elements are located by creating a Selector Hash, which Watir translates into the potentially
complicated information the driver needs to know to identify the element.  
 
 The special cases will be highlighted below, but Watir Locators:
 
 1. Accept `String` values for exact matching
 2. Accept `RegExp` values for partial matching
 3. Can be mixed with any other Watir Locator 
 4. Can be used to find the first matching element, or all matching elements as part of a collection

Firstly, like Selenium, Watir supports the full power of directly using `:css` & `:xpath` selectors. When
 either of these are used, they must be the only one provided in the Selector Hash. 
 Watir's goal, however, is to minimize the need to rely on these powerful locators. 
 XPath in particular can be difficult to read and can be easy to 
write in a brittle fashion, so Watir encourages the approach of "No More XPath!"

Additionally, it is worth noting that there are two locators defined in the WebDriver specification
 that Watir does not directly support because it provides the same functionality by alternate means.  
 These are `:link_text` and `:partial_link_text`.
With Watir you can locate any element by its text, not just links, and Watir already supports
 partial matches for all of its locators with Regular Expressions. 

### Standard Watir Locators

#### ID 

{% highlight ruby %}
browser.div(id: "header")
browser.div(id: /header/)
{% endhighlight %}

#### Name 

{% highlight ruby %}
browser.text_field(name: 'new_user_email')
browser.text_field(name: /new_user_email/)
{% endhighlight %}

#### Tag Name

{% highlight ruby %}
# while this works:
browser.element(tag_name: 'div')
 
# it is highly recommended to leverage this locator by using the element's associated method:
browser.div
{% endhighlight %}

#### Class Name

{% highlight ruby %}
# This is for locating with a single class only
browser.text_field(class: 'name')
browser.text_field(class: /name/)
{% endhighlight %}

#### Text

{% highlight ruby %}
# evaluates what is in the DOM, not what a user can see on the page
browser.button(text: "Button 2")
browser.button(text: /Button/)
{% endhighlight %}

#### Visible Text 

{% highlight ruby %}
# attempts to evaluate based on what a user can see on the page
browser.button(visible_text: "Button 2")
browser.button(visible_text: /Button/)
{% endhighlight %}

#### Data Attributes

{% highlight ruby %}
browser.p(data_type: "ruby-library")
browser.p(data_type: /ruby-library/)
{% endhighlight %}

#### Aria Attributes

{% highlight ruby %}
browser.p(aria_label: "ruby-library")
browser.p(aria_label: /ruby-library/)
{% endhighlight %}

#### Valid or Custom Attributes 

{% highlight ruby %}
browser.link(href: 'non_control_elements.html')
browser.link(href: /non_control_elements.html/)
browser.div(custom_attribute: "foo")
browser.div(custom_attribute: /foo/)
{% endhighlight %}

#### Label

{% highlight ruby %}
# locate based on the value of the associated label element (not attribute)
browser.text_field(label: 'With text'))
browser.text_field(label: /With text/))
{% endhighlight %}

#### Index 
* this can not be used to locate an element collection
* when combined with other locators, index is the last filter to be applied)

{% highlight ruby %}
browser.div(index: 2)
{% endhighlight %}

#### Presence/Absence/Multiple Classes
* this takes an Array of String or RegExp values

{% highlight ruby %}
browser.text_field(class: ['order', 'should', 'matter', 'not'])
browser.text_field(class: ['this', '!notthis'])
{% endhighlight %}

#### Presence/Absence Attributes 
* this takes a Boolean value

{% highlight ruby %}
browser.div(data_bar: false)
browser.div(data_foo: true)        
{% endhighlight %}

#### Visible
* this takes a Boolean value

{% highlight ruby %}
browser.div(visible: true)
browser.div(visible: false)
{% endhighlight %}

#### Adjacent Nodes
* these are not locators in the Selector Hash
* these are methods that accept a Selector Hash 
                
{% highlight ruby %}
anchor_element.parent(selectors)

anchor_element.previous_sibling(selectors)
anchor_element.following_sibling(selectors)
anchor_element.siblings(selectors)

anchor_element.child(selectors)
anchor_element.children(selectors)
{% endhighlight %}

### Implementation Details

Most of the time Watir can translate the Selector Hash into a single XPath expression to quickly identify the element.
 You can get a sense for what this looks like by checking out our sample app [XPathify](http://xpathify.herokuapp.com/).
Instances where this can not be done include when the usage of `:visible`, `:visible_text` or `:index` locators,
or (sometimes) when there are Regular Expressions in the locator values. In that case Watir locates
 potentially matching elements and iterates over them to provide the requested result.
