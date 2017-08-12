---
layout: page
title: Frames
permalink: /articles/frames/
redirect_from: /docs/frames/
---

Browser Context switching is handled for you in Watir.
The only requirement is that when defining an element, it must include any iframes
it is nested inside.

{% highlight ruby %}
b.iframe(id: 'outside').iframe(id: 'inside').div.text
b.iframe(id: 'second').text_field.set 'foo"
b.iframe(id: 'outside').button.click
{% endhighlight %}
