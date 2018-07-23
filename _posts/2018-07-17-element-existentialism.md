---
layout: post
title: Element Existentialism
date: 2018-07-17
author: Titus Fortner
author_url: http://watirtight.com/
comments: true
tags: [Blogs]
---

To Be, or Not to Be... an Element
<!--more-->

### TL/DR

`Element#visible?` will soon do the same thing as `Element#present?`, which has the potential to cause problems if
you rescue `UnknownObjectException` or `UnknownFrameException` in your code. While we aren't officially 
deprecating `#visible?`, we recommend that you make sure that you need to be using any existence check in the first place 
(see point #1 in the next section), and if you do, switch to using `#present?` instead.

### What Matters

There are a bunch of different terms that mean slightly different things when it comes to whether an element "exists".
See the [Terminology section](#terminology) below for the meaning of the terms used in quotes in this article.

There are two major use cases for evaluating whether an element is there. 
1. Ensure it is usable before taking an action on it
* This is what we implemented as the default for Watir 6. We intentionally maintained a distinction 
between taking an action on an element and locating the element. The goal is to allow the instantaneous querying of 
the condition or status of an element at any time, while also making every effort to take the requested action. If
you are using the `#visible?` method as part of a wait, it is likely an unnecessary call at this point and safe to remove.


2. Validate the user can see it
* For this we don't actually care if an element "exists" in the DOM, if it isn't also "displayed," so we need to explore
what this means.

Justin Ko has a [great synopsis](https://jkotests.wordpress.com/2012/11/02/checking-for-an-element-exists-visible-present/)
of the three applicable predicate methods for a Watir element. Of these three, "exist" is typically insufficient
for our needs and "visible" is redundant. In the US Legislature, a Representative has three options for a vote: 
"aye", "no," and "present." I like that this connotation of "present" is the one that Watir chose to use, as it 
indicates that the member is in plain sight on the floor of Congress and in a state ready and able to take action.

For comparison, [Capybara](https://github.com/teamcapybara/capybara/) makes no distinction between `#exist?`, `#visible?` and `#present?`, 
there is only `#find` and this method will only locate "displayed" elements. 
To locate an element that "exists" but is not "displayed," the
user must pass in `hidden: true`. I like that Watir makes it easier to locate and query elements without needing to 
know their state ahead of time, but we also have more options and more confusion than we want or need.
 
### Clarifying Confusions

##### Q: What does `Watir::Element#visible?` do that `Watir::Element#present?` does not?
A: Nothing except throw an exception when the element does not "exist" in the DOM. 

##### Q: Does `#present?` or `#visible?` change if I scroll the element out of view?
A: No. These methods are ultimately implemented by the atom `isShown`, and only attempts to answer the question of whether it 
 can be seen by the user assuming that the element is moved into the viewport first, even if it has not been.

##### Q: If `#present?` returns `true`, does that mean the element is interactable?
A: Unfortunately, not necessarily. It is possible that attempting to click the element will give a "click intercepted" error 
or an "element not interactable" error. Future versions of the w3c specification are likely going to provide
 endpoints to evaluate whether this is true without taking the action, and future versions of Watir will make it easier
 to set default handling behaviors for these issues. At this point it might still be messy, so 
 [reach out to us](http://watir.com/help/) if you get stuck trying to handle this situation.

##### Q: If `#present?` returns `true`, does that mean the element is actually able to be seen by the user?
A: Unfortunately, also not necessarily. The W3C WebDriver specification ended up not even trying to determine
[what makes an element displayed](https://w3c.github.io/webdriver/#element-displayedness). For more details, you
can watch David Burns [speak about this](https://www.youtube.com/watch?v=hTa1KI6fQpg&index=12&list=PLPJWVzLeEy93T9EBvfn9KAmrYYez3oGcD)
 at the Selenium Conference in London a couple years ago.                    

### Terminology

* [viewport](https://drafts.csswg.org/css-device-adapt/#the-viewport) - 
the subset of the page that can be viewed by the user at a given time (this will vary by device, window size, etc)
* [displayed](https://github.com/SeleniumHQ/selenium/wiki/JsonWireProtocol#sessionsessionidelementiddisplayed) - 
Selenium's JSON Wire Protocol Endpoint called from `isDisplayed` method
* [shown](https://github.com/SeleniumHQ/selenium/blob/e09e28f016c9f53196cf68d6f71991c5af4a35d4/javascript/atoms/dom.js#L437) - 
The JavaScript atom used by most of the drivers is called `isShown`
* exists - Watir's oldest boolean method that determines if an element is in the DOM regardless of state
* visible - Assuming that an element "exists," Watir uses Selenium to determine if it is "displayed"
* present - Watir determines if the element both "exists" and is "visible"
* hidden - A filtering option used by Watir & Capybara for elements that are "displayed"
* [interactable](https://w3c.github.io/webdriver/#dfn-interactable) - Attempting to determine if an action can be taken

See the [Changelog](https://github.com/watir/watir/blob/master/CHANGES.md) 
for the complete history of updates.