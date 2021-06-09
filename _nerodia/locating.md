---
layout: nerodia
title: Locating Elements
permalink: /nerodia/locating/
modified_date: 2021-06-09
---

One of the most important features of Nerodia is the many varied ways it allows users to locate elements.
The Nerodia location API is designed to be easily read and understood by users (humans).
Elements are located by creating Selector Keywords, which Nerodia translates into the potentially
complicated information the driver needs to know to identify the element.  
 
 The special cases will be highlighted below, but Nerodia Locators:
 
 1. Accept `String` values for exact matching
 2. Accept compiled regex values for partial matching
 3. Can be mixed with any other Nerodia Locator 
 4. Can be used to find the first matching element, or all matching elements as part of a collection

Firstly, like Selenium, Nerodia supports the full power of directly using `:css` & `:xpath` selectors. When
 either of these are used, they must be the only one provided in the Selector Hash. 
 Nerodia's goal, however, is to minimize the need to rely on these powerful locators. 
 XPath in particular can be difficult to read and can be easy to 
write in a brittle fashion, so Nerodia encourages the approach of "No More XPath!"

Additionally, it is worth noting that there are two locators defined in the WebDriver specification
 that Nerodia does not directly support because it provides the same functionality by alternate means.  
 These are `:link_text` and `:partial_link_text`.
With Nerodia you can locate any element by its text, not just links, and Nerodia already supports
 partial matches for all of its locators with Regular Expressions. 

### Standard Nerodia Locators

#### ID 

{% highlight python %}
browser.div(id="header")
{% endhighlight %}

#### Name 

{% highlight python %}
browser.text_field(name= 'new_user_email')
{% endhighlight %}

#### Tag Name

{% highlight python %}
# while this works:
browser.element(tag_name= 'div')
 
# it is highly recommended to leverage this locator by using the element's associated method:
browser.div
{% endhighlight %}

#### Class Name

{% highlight python %}
# This is for locating with a single class only
browser.text_field(class_name='name')
{% endhighlight %}

#### Text

{% highlight python %}
# evaluates what is in the DOM, not what a user can see on the page
browser.button(text= "Button 2")
{% endhighlight %}

#### Visible Text 

{% highlight python %}
# attempts to evaluate based on what a user can see on the page
browser.button(visible_text="Button 2")
{% endhighlight %}

#### Data Attributes

{% highlight python %}
browser.p(data_type="python-library")
{% endhighlight %}

#### Aria Attributes

{% highlight python %}
browser.p(aria_label= "python-library")
{% endhighlight %}

#### Valid or Custom Attributes 

{% highlight python %}
browser.text_field({'aria-labelledby': 'elastic.0'})
{% endhighlight %}

#### Label

{% highlight python %}
# locate based on the value of the associated label element (not attribute)
browser.text_field(label= 'With text'))
{% endhighlight %}

#### Index 
* this can not be used to locate an element collection
* when combined with other locators, index is the last filter to be applied)

{% highlight python %}
browser.div(index= 2)
{% endhighlight %}

#### Presence/Absence/Multiple Classes
* this takes an Array of String values

{% highlight python %}
browser.text_field(class_name=['order', 'should', 'matter', 'not'])
browser.text_field(class_name=['this', '!notthis'])
{% endhighlight %}

#### Presence/Absence Attributes 
* this takes a Boolean value

{% highlight python %}
browser.div(data_bar=False)
browser.div(data_foo=True)       
{% endhighlight %}

#### Visible
* this takes a Boolean value

{% highlight python %}
browser.div(visible=True)
browser.div(visible=False)
{% endhighlight %}

#### Adjacent Nodes
* these are not locators in the Selector Hash
* these are methods that accept a Selector Hash 
                
{% highlight python %}
anchor_element.parent(selectors)

anchor_element.previous_sibling(selectors)
anchor_element.following_sibling(selectors)
anchor_element.siblings(selectors)

anchor_element.child(selectors)
anchor_element.children(selectors)
{% endhighlight %}

### Implementation Details

Most of the time Nerodia can translate the Selectors into a single XPath expression to quickly identify the element.
 You can get a sense for what this looks like by checking out our sample app [XPathify](http://xpathify.herokuapp.com/).
Instances where this can not be done include when the usage of `:visible`, `:visible_text` or `:index` locators. 
In that case Nerodia locates potentially matching elements and iterates over them to provide the requested result.
