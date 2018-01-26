---
layout: post
title: Introducing Nerodia
date: 2018-01-24
author: Josh Grant
author_url: http://simplythetest.tumblr.com
comments: true
categories: [Addons]
---

Attention Pythonistas: now you too can use Watir! There is now a Python implementation of Watir called [Nerodia](https://github.com/watir/nerodia). This project is early in development, but as of its latest release (as of this writing) Nerodia is feature complete with the latest released version of Watir (6.10.2) . There is ongoing work to get Nerodia as up-to-date with Watir as possible while keeping the Python implementation as Pythonic as possible.

Nerodia is tested against Python 2.7 and 3.4+ and has support for Chrome, Firefox, Internet Explorer, Edge, and Safari. It can be installed via `pip` by

{% highlight python %}
pip install nerodia
{% endhighlight %}

Nerodia is the first implementation of Selenium based Watir outside of Ruby, which is pretty exciting for the Watir project overall. This is an opportunity to see what translates well from Ruby to other languages. 

### Designed for Browser Test Automation
Watir is a tool designed for browser test automation first. It is built from the perspective of developers and testers who want reliable browser automation that can scale with a browser automation project. Nerodia is designed from the same perspective, matching Watir’s approaches to browser handling, synchronizing actions, and providing flexible locators for working with DOM elements. 

### Powered by Selenium
Being a browser test automation tool, Nerodia uses the Selenium WebDriver internally. Nerodia takes advantage of all the capabilities of the Selenium WebDriver while providing a better user experience for writing automated browser tests. As well, Nerodia is compatible with using existing WebDriver instances or options that may be used to construct a Nerodia instance directly.

If you’re interested in automated browser testing, or have been interested in Watir but using Python, check it out! Information on how to get involved or how to ask a question can be found in the GitHub link above.
