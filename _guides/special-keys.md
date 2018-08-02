---
layout: guide
title: Sending Special Keys
permalink: /guides/special-keys/
redirect_from: 
 - /docs/sending-special-keys/
---

<!--- TODO: Validate Examples --->
<!--- TODO: These should be `#set` not `#send_keys` right? --->

To send special keys to an element or browser page, you use the `#send_keys` method, with a symbolic representation of what 
you would like to send.

{% highlight ruby %}
b.send_keys :enter
{% endhighlight %}

You can also do things like this:

{% highlight ruby %}
b.element.send_keys [:control, 'a'], :backspace
{% endhighlight %}

You can also modify the click behaviour with keys:

{% highlight ruby %}
b.element.click(:shift, :control)
{% endhighlight %}

The full list of keys are available from here:

* :null
* :cancel
* :help
* :backspace
* :tab
* :clear
* :return
* :enter
* :shift
* :left_shift
* :control
* :left_control
* :alt
* :left_alt
* :pause
* :escape
* :space
* :page_up
* :page_down
* :end
* :home
* :left
* :arrow_left
* :up
* :arrow_up
* :right
* :arrow_right
* :down
* :arrow_down
* :insert
* :delete
* :semicolon
* :equals
* :numpad0
* :numpad1
* :numpad2
* :numpad3
* :numpad4
* :numpad5
* :numpad6
* :numpad7
* :numpad8
* :numpad9
* :multiply
* :add
* :separator
* :subtract
* :decimal
* :divide
* :f1
* :f2
* :f3
* :f4
* :f5
* :f6
* :f7
* :f8
* :f9
* :f10
* :f11
* :f12
* :meta
* :command
