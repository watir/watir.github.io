---
layout: page
title: Frames
permalink: /docs/frames/
---

Frames are fairly easy to deal with in Watir, just use them the same way as any other element.

{% highlight ruby %}
b.frame(id: 'content_ifr').send_keys 'hello world'
{% endhighlight %}
