---
layout: guide
title: Page Objects
permalink: /guides/page-objects/
redirect_from: /docs/page-objects/
---

<!--- TODO: This code needs to be re-verified  --->

The Page Object pattern is a way to represent pages and their elements in reusable classes. 
Page Objects eliminate duplication by building an abstraction that allows you to write browser tests for 
maximum maintainability and robustness.

The Page Object pattern originated in WebDriver, and a great explanation (with examples in Java) 
can be found [here](https://github.com/SeleniumHQ/selenium/wiki/PageObjects).

You create a Page object for each page of your application, which has methods that represent the services 
available on a given page. You should encapsulate all the implementation details of the 
system (i.e. HTML elements, waiting for the DOM to update etc) in these objects. 
Your test code (i.e. RSpec code blocks, Cucumber step definitions) should never access the 
underlying Browser instance or deal with HTML elements directly.

In essence, you should have the mindset that your test code should not need to change if your 
web app was rewritten as a desktop app - you would simply need another implementation of the page 
object layer. Although strictly speaking a set of pages isn't necessarily a good way to model a 
desktop application, having this in mind makes it easy to decide what should go where.

The examples below assumes you are familiar with [RSpec](http://rspec.info/) way of doing test assertions.

Consider this script:

{% highlight ruby %}
  browser = Watir::Browser.new
  browser.goto "http://example.com/login"

  browser.text_field(:name => "user").set "Mom"
  browser.text_field(:name => "pass").set "s3cr3t"
  browser.button(:id => "login").click

  Watir::Wait.until { browser.title == "Your Profile" }
  browser.div(:id => "logged-in").should exist
{% endhighlight %}

With page objects, this could become:


{% highlight ruby %}
  site = Site.new(Watir::Browser.new)

  login_page = site.login_page.open
  user_page = login_page.login_as "Mom", "s3cr3t"

  user_page.should be_logged_in
{% endhighlight %}

An implementation of this could be:

{% highlight ruby %} 
  class BrowserContainer
    def initialize(browser)
      @browser = browser
    end
  end

  class Site < BrowserContainer
    def login_page
      @login_page = LoginPage.new(@browser)
    end

    def user_page
      @user_page = UserPage.new(@browser)
    end

    def close
      @browser.close
    end
  end # Site

  class LoginPage < BrowserContainer
    URL = "http://example.com/login"

    def open
      @browser.goto URL
      self
    end

    def login_as(user, pass)
      user_field.set user
      password_field.set pass

      login_button.click

      next_page = UserPage.new(@browser)
      Watir::Wait.until { next_page.loaded? }

      next_page
    end

    private

    def user_field
      @browser.text_field(:name => "user")
    end

    def password_field
      @browser.text_field(:name => "pass")
    end

    def login_button
      @browser.button(:id => "login")
    end
  end # LoginPage

  class UserPage < BrowserContainer
    def logged_in?
      logged_in_element.exists?
    end

    def loaded?
      @browser.title == "Your Profile"
    end

    private

    def logged_in_element
      @browser.div(:id => "logged-in")
    end
  end # UserPage
{% endhighlight %}

This can then be integrated with other tools. For example, using Cucumber you could have this in env.rb:

{% highlight ruby %} 
require "watir-webdriver"
require "/path/to/site"

module SiteHelper
  def site
    @site ||= (
      Site.new(Watir::Browser.new(:firefox))
    )
  end
end

World(SiteHelper)
{% endhighlight %}

And this step definition:

{% highlight ruby %} 
 Given /I have successfully logged in/ do
   login_page = site.login_page.open

   user_page = login_page.login_as "Mom", "s3cr3t"
   user_page.should be_logged_in
 end

{% endhighlight %}


Assertions/expectations should be kept in your test code. Don't use assertions
in your page objects; instead ask them about their state, and assert on the result. E.g.:

{% highlight ruby %} 

  #
  # bad example
  #

  class SomePage
    def assert_loaded
      raise "not loaded" unless some_element.exists?
    end
  end

  it "should be loaded" do
    page.assert_loaded
  end

  #
  # good example
  #

  class SomePage
    def loaded?
      some_element.exists?
    end
  end

  it "should be loaded" do
    page.should be_loaded
  end
{% endhighlight %}

See also:

**Page Object gems that work with Watir-webdriver**
* [Cheezy's Page Object gem for Watir-webdriver and Selenium](https://github.com/cheezy/page-object)
* [The rSmart Test-Factory gem for Page & Data objects using Watir-webdriver](https://github.com/rSmart/TestFactory)
* [Watir Page Helper](http://watirmelon.com/2011/05/05/introducing-the-watir-page-helper-gem/)
* [LoadableComponent](http://github.com/jarib/loadable_component)

**Blog postings related to Page Objects and Watir-webdriver**
* cheezyworld's series on UI testing [part 1](http://www.cheezyworld.com/2010/11/09/ui-tests-not-brittle/), [part 2](http://www.cheezyworld.com/2010/11/13/ui-tests-part-two/), [part 3](http://www.cheezyworld.com/2010/11/19/ui-tests-introducing-a-simple-dsl/), [part 4](http://www.cheezyworld.com/2010/11/21/ui-tests-default-dat/), [part 5](http://www.cheezyworld.com/2010/12/16/ui-tests-putting-it-all-together/)
* Watermelon blog article on ['roll your own' page objects](http://watirmelon.com/2012/06/04/roll-your-own-page-objects/)

**Blog postings related to Page Objects and webdriver/Selenium**
* [Page Objects on the Selenium Wiki](https://github.com/SeleniumHQ/selenium/wiki/PageObjects)
* [Page Objects in Python](http://www.pragprog.com/magazines/2010-08/page-objects-in-python)
* [Automated Testing using Page Objects and WebDriver](http://www.peternewhook.com/2010/09/automated-testing-pageobjects-webdriver/)
* [Acceptance tests with JBehave, Selenium and Page Objects](http://blog.m.artins.net/acceptance-tests-with-jbehave-selenium-page-objects/)
* [Using the Page Object pattern](http://www.slideshare.net/dantebriones/using-the-page-object-pattern)
* [Selenium 2/Web Driver - the land where Page Objects are king!](http://www.wakaleo.com/blog/selenium-2-web-driver-the-land-where-page-objects-are-king)
