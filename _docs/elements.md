---
layout: docs
title: Web Elements
permalink: /docs/elements/
---

All HTML elements are supported by Watir-WebDriver. Some examples are below:

### Text Fields

{% highlight ruby %}
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
t = b.text_field :id => 'entry_1000000'
t.exists?
t.set 'your name'
t.value
{% endhighlight %}

### Select Lists – Combos

{% highlight ruby %}
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
s = b.select_list :id => 'entry_1000001'
s.select 'Ruby'
s.selected_options
{% endhighlight %}

### Radios

{% highlight ruby %}
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
r = b.radio :value => 'A gem'
r.exists?
r.set
r.set?
{% endhighlight %}

### Checkboxes

{% highlight ruby %}
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
c = b.checkbox :value => '1.9.2'
c.exists?
c.set
c.set?
{% endhighlight %}

### Buttons

{% highlight ruby %}
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
btn = b.button :value => 'Submit'
btn.exists?
btn.click
{% endhighlight %}

### Links

{% highlight ruby %}
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
l = b.link :text => 'Google Forms'
l.exists?
l.click
{% endhighlight %}

### Divs & Spans

{% highlight ruby %}
require 'watir-webdriver'
b = Watir::Browser.start 'bit.ly/watir-webdriver-demo'
d = b.div :class => 'ss-form-desc ss-no-ignore-whitespace'
d.exists?
d.text
s = b.span :class => 'powered-by-text'
s.exists?
s.text
{% endhighlight %}

### WYSIWYG Editors

See: [WYSIWYG Editors](../wysiwyg-editors) page
