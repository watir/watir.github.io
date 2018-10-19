---
layout: post
title: Stale Element Behavior Changes
date: 2018-09-11
author: Titus Fortner
author_url: http://watirtight.com/
comments: true
tags: [Watir7]
---

Dude, Where's My Element? An explanation of the `stale_exists`, `stale_visible` and `stale_present` deprecations
<!--more-->

** Update 2018-10-19: this article has been updated to include the `stale_exists` deprecation 

### Selenium Elements vs Watir Elements

Let's start with the fundamental difference between what Selenium & Watir consider elements.  

* A Selenium Element is a reference to the object
returned by the Driver representing something that currently exists in the DOM.

* A Watir Element is a location or address of an object in a DOM.

Watir is lazy loaded (the object can be initialized without currently existing), Selenium is not.
Watir can relocate elements, Selenium can not.

### What is Staleness?

An element becomes stale when the driver can no longer locate the object being referenced. This
can happen any time something in the DOM changes. This includes either a full refresh of the page, or 
some dynamic action (adding, deleting or otherwise moving things around) after the element was located.

Prior to watir-webdriver 0.7, StaleElement Exceptions were a common occurrence and one of 
the major sources of user frustration. 

### Watir 6 is Inconsistent

Recognize that this idea of "staleness" only applies to Selenium's conception of an Element.
For Watir, there either is or isn't an element at the specified address.

Right now, though, the following behavior exists:

{% highlight ruby %}
it 'returns different responses when called more than once' do
  browser.goto(WatirSpec.url_for('forms_with_input_elements.html'))
  element = browser.text_field(id: 'new_user_email').tap(&:exists?)

  browser.refresh       # all elements become stale

  expect(element.present?).to be false
  expect(element.present?).to eq true
end
{% endhighlight %}

A major use case for this is to allow people to use `#wait_while_present` to wait for the DOM to be changed.

### Making it Flow Like Watir

So, Nothing has changed on the page, but subsequent calls of the same method return different
answers. Plus, as discussed, the first answer doesn't treat the element like a Watir Element.

In Watir 7, every call to `#present?` will attempt to relocate the element if it is not there.
To provide access to the existing (Selenium behavior), we created a method `#stale?`.
Instead of `wait_while(&:present?)` use this instead: `wait_until(&:stale?)`.

### Deprecation Warnings

Watir is now logging deprecation notices for `stale_exists`, `stale_present` and `stale_visible` in preparation
for a Watir 7 release.

If you are using `#exists?`, `#present?`, `#visible?` or some form of `wait_while` with these methods, and
you are receiving this notice, be aware that your tests might break in Watir 7. Keep in mind
how Watir considers elements, and make use of `#stale?` if your usage does not match Watir's usage.

### Ignoring Warnings

To turn off all deprecation notices (not recommended):
{% highlight ruby %}
Watir.logger.ignore(:deprecations)
{% endhighlight %}

To turn off these specific notices:
{% highlight ruby %}
Watir.logger.ignore(%i[stale exists stale_present stale_visible])
{% endhighlight %}
