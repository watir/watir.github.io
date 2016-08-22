---
layout: post
title: Gem Update
date: 2016-08-02
author: Titus Fortner
author_url: http://watirtight.com/
comments: true
categories: [Releases]
---

Watir-WebDriver 0.9.2 and 0.9.3 (which is a minor bug fix to 0.9.2) have been released!
Alex did some great work on this one, with significant updates to element locator implementation.

<!--more-->

[Read the full Changelog](https://github.com/watir/watir/blob/master/CHANGES.md).

The previous `ElementLocator` class
was very unwieldy, so it has been broken up for better separation of concerns.
Now building the selector and validating a found element are no longer coupled to
the actual locating functionality.

The huge ramification of this change is that the means of locating elements is now
extensible from outside the project. An example implementation of this is
[Watizzle](https://github.com/p0deje/watizzle).
