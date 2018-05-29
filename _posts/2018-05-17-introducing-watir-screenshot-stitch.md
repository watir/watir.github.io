---
layout: post
title: Introducing watir-screenshot-stitch
date: 2018-05-29
author: Sam Nissen
author_url: https://about.me/samnissen
comments: true
categories: [Addons]
---

watir-screenshot-stitch provides two strategies to create
screenshots larger than the viewport using Watir.

Selenium no longer supports full page screenshots,
(though some drivers might [add this functionality at some point](https://github.com/mozilla/geckodriver/issues/570)
in the future). Now you can with the
[watir-screenshot-stitch gem](https://github.com/samnissen/watir-screenshot-stitch)
– it extends Watir::Screenshot to give you
two new public methods:

## Watir::Screenshot#save_stitch

`save_stitch` will take images while paging down the page,
and stitch them together with ImageMagick:

{% highlight ruby %}
require 'watir-screenshot-stitch'

url = "http://your.url"
path = "/path/to/your/image.png"
opts = { page_height_limit: 6000 }

b = Watir::Browser.new
b.goto url
b.save_stitch(path, b, opts)
# ...
{% endhighlight %}

Note that ImageMagick has a 65500 pixel dimension limit,
so `save_stitch` will stop taking screenshots when it
reaches that pixel height. If you provide a (optional)
page height limit lower than that, it will stop after
reaching that pixel height instead.

## Watir::Screenshot#base64_canvas

`base64_canvas` employs [html2canvas](https://github.com/niklasvh/html2canvas),
a JavaScript HTML renderer to construct a screenshot base64-encoded
image blob.

{% highlight ruby %}
require 'watir-screenshot-stitch'

url = "http://your.url"

b = Watir::Browser.new
b.goto url
base64_string = b.base64_canvas(b)

blob = Base64.decode64(base64_string)
image = MiniMagick::Image.read(blob)
image.write 'image.png'
# ...
{% endhighlight %}

Because html2canvas has not yet released a version 1.0,
and because it does not actually take a screenshot,
your results may vary.

## Future work

If you find any bugs, have any feature you want to see, whatever,
please feel free to head to [GitHub](https://github.com/samnissen/watir-screenshot-stitch)
or [email me](mailto:scnissen@gmail.com) or catch me on
the [Watir Slack](http://watir.com/help/).
