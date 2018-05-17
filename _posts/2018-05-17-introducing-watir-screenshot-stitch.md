---
layout: post
title: Introducing watir-screenshot-stitch
date: 2018-05-17
author: Sam Nissen
author_url: https://about.me/samnissen
comments: true
categories: [Addons]
---

Selenium no longer supports full page screenshots,
[(though it might again)](https://github.com/mozilla/geckodriver/issues/570).
But that’s OK! Watir still can – there are many methods,
and the [watir-screenshot-stitch](https://github.com/samnissen/watir-screenshot-stitch)
gem employs two of them. It extends Watir::Screenshot to give you
two new public methods:

## Watir::Screenshot#save_stitch

`save_stitch` will take images while paging down the page,
and stitch them together with ImageMagick:

```ruby
require 'watir-screenshot-stitch'

url = "http://your.url"
path = "/path/to/your/image.png"
opts = { page_height_limit: 6000 }

b = Watir::Browser.new
b.goto url
b.save_stitch(path, b, opts)
# ...
```

Note that ImageMagick has a 65500 pixel dimension limit,
so `save_stitch` will stop taking screenshots when it
reaches that pixel height. If you provide a (optional)
page height limit lower than that, it will stop after
reaching that pixel height instead.

## Watir::Screenshot#base64_canvas

`base64_canvas` employs [html2canvas](https://github.com/niklasvh/html2canvas),
a JavaScript HTML renderer to construct a screenshot base64-encoded
image blob.

```ruby
require 'watir-screenshot-stitch'

url = "http://your.url"

b = Watir::Browser.new
b.goto url
base64_string = b.base64_canvas(b)

blob = Base64.decode64(base64_string)
image = MiniMagick::Image.read(blob)
image.write 'image.png'
# ...
```

Because html2canvas has not yet released a version 1.0,
and because it does not actually take a screenshot,
your results may vary.

## Passing the browser is weird ... and it's kind of a bad gem name

Watir passes the driver to the Screenshot class,
but I wanted use native Watir to execute the commands,
meaning you are lucky enough to pass it through for me to use.
And yeah, the name probably shouldn't have been tied to the
first method I developed.

## That's it

If you find any bugs, have any feature you want to see, whatever,
please feel free to head to [GitHub](https://github.com/samnissen/watir-screenshot-stitch)
or [email me](mailto:scnissen@gmail.com) or catch me on
the [Watir Slack](http://watir.com/help/).
