---
layout: guide
title: Watir Example - Form Filling
permalink: /guides/form-example/
modified_date: 2021-03-28
---

### Install these gems from the command line

{% highlight bash %}
gem install 'watir'
gem install 'webdrivers'
gem install 'faker'
{% endhighlight %}

### Execution Options

* Copy the Watir code below into a file (e.g. `watir-example.rb`) and execute from the command line with:
{% highlight bash %}
ruby watir-example.rb
{% endhighlight %}
* Open irb and enter each command line by line to see what it is doing
{% highlight bash %}
irb
{% endhighlight %}

### Watir Code Example

You can get more detailed information about working with these different elements in our
[Web Elements Guide](/guides/elements/#special-handling-of-specific-elements)

{% highlight ruby %}
# Require the gems we want to use
require 'watir'
require 'webdrivers'
require 'faker'

# Initialize the Browser
browser = Watir::Browser.new

# Navigate to Page
browser.goto 'watir.com/examples/simple_form.html'

# Fill out Text Field Names
browser.text_field(id: 'first_name').set 'Luke'
browser.text_field(id: 'last_name').set 'Perry'

# Use Random Email Address via Faker gem
# Read more about Faker gem here: https://github.com/stympy/faker#readme
random_email = Faker::Internet.email
browser.text_field(id: 'email').set random_email

# Select List:
browser.select(id: 'country').select 'Norway'

# Checkboxes:
browser.checkbox(id: 'interests_cars').click
browser.checkbox(id: 'interests_dentistry').click

# Radio Button:
browser.radio(id: 'newsletter_no').click

# Use RadioSet instead of Radio Button:
browser.radio_set(name: 'newsletter').select('Yes')

# Click Button:
browser.button(id: 'submitButton').click

# Evaluate Results:
browser.p(id: 'name').text == 'Hello Luke Perry,' # => true
browser.p(id: 'newsletter').text == "You will be receiving our newsletter at #{random_email}" # => true
browser.p(id: 'activities').text == 'We hope you continue to enjoy cars, dentistry in Norway' # => true
{% endhighlight %}
