---
layout: page
title: WYSIWYG Editors
permalink: /docs/wysiwyg/
---

There are two ways to enter text into a WYSIWYG editor using Watir-WebDriver:

* Locate the iFrame, and use .send_keys to enter text (downside is browser must be in the foreground)
* Execute javascript on the browser object that sets the value of the WYSIWYG editor (most reliable method)

### CKEditor

{% highlight ruby %}
require 'watir'
b = Watir::Browser.new :firefox
b.goto 'http://ckeditor.com/demo'
b.execute_script("CKEDITOR.instances['editor1'].setData('hello world');")
b.frame(title: 'Rich text editor, editor1, press ALT 0 for help.').send_keys 'hello world again'
{% endhighlight %}

### TinyMCE Editor

{% highlight ruby %}
require 'watir'
b = Watir::Browser.new
b.goto 'http://tinymce.moxiecode.com/tryit/full.php'
b.execute_script("tinyMCE.get('content').execCommand('mceSetContent',false, 'hello world' );")
b.frame(id: 'content_ifr').send_keys 'hello world again'
{% endhighlight %}
