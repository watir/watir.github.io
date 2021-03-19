---
layout: guide
title: WYSIWYG Editors
permalink: /guides/wysiwyg/
redirect_from: /docs/wysiwyg/
modified_date: 2018-08-02
---

<!--- TODO: Add info on `#make_editable` if that method appears in Watir 6.13  --->
<!--- TODO: Figure out how to get the JS Solutions working  --->

The recommended way to enter text into a WYSIWYG editor using Watir is to locate
the iFrame, then find the  and use the `#send_keys` method.

Alternately you can execute javascript on the browser object that sets the value of the 
WYSIWYG editor.

### CKEditor

Recommended:

{% highlight ruby %}
b = Watir::Browser.new
b.goto 'http://nightly.ckeditor.com/18-08-02-06-04/standard/samples/'
b.iframe.body.wd.clear
b.iframe.body.send_keys "foo"
{% endhighlight %}

> Note that this example no longer works. If anyone has a working example, please update this code

{% highlight ruby %}
b = Watir::Browser.new :firefox
b.goto 'http://nightly.ckeditor.com/18-08-02-06-04/standard/samples/'
b.execute_script("CKEDITOR.instances['editor1'].setData('hello world');")
f = b.frame(title: 'Rich text editor, editor1, press ALT 0 for help.')
f.send_keys 'hello world again'
{% endhighlight %}

### TinyMCE Editor

Recommended:

{% highlight ruby %}
b = Watir::Browser.new
b.goto 'http://tinymce.moxiecode.com/tryit/full.php'
f = b.iframe(id: 'cp_embed_NGegZK').iframe(id: 'result-iframe')
wysiwg = f.iframe.body
wysiwg.wd.clear
wysiwg.send_keys "hello world"
{% endhighlight %}

> Note that this example no longer works. If anyone has a working example, please update this code

{% highlight ruby %}
b = Watir::Browser.new
b.goto 'http://tinymce.moxiecode.com/tryit/full.php'
b.execute_script("tinyMCE.get('content').execCommand('mceSetContent',false, 'hello world' );")
b.frame(id: 'content_ifr').send_keys 'hello world again'
{% endhighlight %}
