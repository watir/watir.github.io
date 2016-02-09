---
layout: docs
title: Watir Webdriver
permalink: /docs/home/
redirect_from: /docs/home/
---

##### Welcome to the home of **Watir WebDriver**: the most elegant way to use WebDriver with Ruby.

**Watir** (pronounced Water: I know it’s confusing) stands for **W**eb **A**pplication **T**esting **i**n **R**uby, and the **WebDriver** part stands for, um, WebDriver.

### What browsers does Watir-WebDriver support?

Any browser that WebDriver supports: namely Firefox, Chrome, IE and Safari.

### How good is Watir-WebDriver?

I could make up lots of quotes about how good it is, but I don’t need to, it’s that good.

### Getting Started

{% highlight bash %}
gem install watir-webdriver
{% endhighlight %}

or just add watir-webdriver to your gemfile if you rock and use bundler (if you don’t use bundler, you should, right now).

Watir-WebDriver ♥s ruby 1.9.3, but it won’t complain in older versions nonetheless

### Getting Going

Ready, steady… at a prompt, type irb. Meet Ruby, your servant who will perform any (syntactically correct) command you can throw her way. So type in the following commands one by one (but don’t shout them) to see some amazing things happen in browserland:

{% highlight ruby %}
require 'watir-webdriver'
b = Watir::Browser.new
b.goto 'bit.ly/watir-webdriver-demo'
b.text_field(:id => 'entry_1000000').set 'your name'
b.select_list(:id => 'entry_1000001').select 'Ruby'
b.select_list(:id => 'entry_1000001').selected? 'Ruby'
b.button(:name => 'submit').click
b.text.include? 'Thank you'
{% endhighlight %}

Wow, wasn’t that easy! You’re a pro; you should make yourself a cup-of-tea for your good work.

### Look Ma! No xpath selectors!

One of things you should have noticed straight away is the absense of xpath selectors. Whilst Watir-WebDriver fully supports xpath (and css) selectors, you’ll find the API so awesome that you’ll find you don’t ever need to use them, unless you’re feeling kinda messed up.

### Look Ma! No training wheels!

Automated test script recorders (like Selenium IDE) are for dummies. Seriously. The combination of the instant feedbackness of irb, with the awesomeness of the Watir-WebDriver API means you’ll be way more productive and efficient using these two things that you’ll ever be with a silly recorder. Plus your scripts will run 1000x better because you they won’t be full of the guff that was recorded by that silly recorder, such as a 100 character css selector that neither you, or anyone else, understands.

### ♥ Cucumber and Watir-WebDriver sitting in a tree ♥

Cucumber + Watir-WebDriver are a match made in heaven. They work really well together to automate your web app testing with a business domain specific specification layer. See specification by example: a love story.

### The Power of Ruby

Ruby is an amazing language and a joy to use. You’ll often find something new each day that makes your life, and your love of ruby, that little bit better. Watir-WebDriver is no different.
