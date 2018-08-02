---
layout: guide
title: Frames
permalink: /guides/frames/
redirect_from: /docs/frames/
---

Think of an IFrame as a page of HTML inside of another page of HTML. By default the driver
only looks for elements in the top level browsing context. If an element exists inside
of an iframe, it must be told to look there. Browser Context switching is handled for you in Watir.
The only requirement is that when defining an element, it must include the full address to that
element including a reference to any iframes it is nested inside.

{% highlight ruby %}
b.iframe(id: 'outside').iframe(id: 'inside').div.text
b.iframe(id: 'second').text_field.set 'foo"
b.iframe(id: 'outside').button.click
{% endhighlight %}

As of [Watir 6.9](/watir-6-9/), if an element can not be located, Watir will check to see
if the page has iframes and will advise the user to check to see if the element is inside of
an IFrame.
