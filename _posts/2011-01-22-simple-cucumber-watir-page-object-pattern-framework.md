---
layout: post
title: A simple Cucumber + Watir page object pattern framework
date: 2011-01-22 04:44
author: Alister Scott
author_url: http://watirmelon.com
comments: true
categories: [Alister Scott, Blogs, Cucumber, Page Object, Page Object Pattern, Watir, watirmelon]
---
<!--more-->

This post by Alister Scott originally appeared on <a href="http://watirmelon.com/2011/01/21/my-simple-cucumber-watir-page-object-pattern-framework/">watirmelon.com</a>. Please leave all comments on the original article.

<hr />

<strong>Introduction</strong>

I was very impressed with Jeff Morgan, known as Cheezy, who recently wrote <a href="http://www.cheezyworld.com/2010/12/16/ui-tests-putting-it-all-together/">a series of blog posts</a> about how to use Cucumber and Watir, and shared his code on <a href="https://github.com/cheezy/uitesting_blog">Github</a>.

I love it when people share their ideas this like, so I thought I would share what I have found useful when setting up a very simple Cucumber with Watir (Celerity &amp; Watir-WebDriver) page object pattern framework, and how this compares to what Jeff has proposed.

<strong>Show me the code!</strong>

Before we begin, I'll show you my code. It's all <a href="https://github.com/alisterscott/WatirMelonCucumber">on Github</a>, right now, as we speak, and you can easily fork and clone this repository to play around with it. It uses a simple google search example.

<strong>Project Folder Structure</strong>

<a href="http://watirmelon.files.wordpress.com/2011/01/folder-structure.jpg"><img class="alignnone size-full wp-image-783" title="folder structure" src="http://watirmelon.files.wordpress.com/2011/01/folder-structure.jpg" alt="" width="307" height="362" /></a>

### Google Search Feature

    Feature: Google Search
      As a casual internet user
      I want to find some information about watir, and do a quick conversion
      So that I can be knowledgeable being

    Scenario: Search for Watir
      Given I am on the Google Home Page
      When I search for "Watir"
      Then I should see at least 100,000 results

    Scenario: Do a unit conversion
      Given I am on the Google Home Page
      When I convert 10 cm to inches
      Then I should see the conversion result
                "10 centimeters = 3.93700787 inches"

    Scenario: Do a search using data specified externally
      Given I am on the Google Home Page
      When I search for a ridiculously small number of results
      Then I should see at most 5 results


<strong>Page Object Pattern</strong>

For our example, we have two <em>page objects</em>. The page classes delegate any methods that don't exist on the page to the Browser object that is passed in from Cucumber. This ensures you can call browser specific methods (.title, .url etc.) at the page object level without duplicating methods.

    class GoogleHomePage

      attr_accessor :search_field, :google_search_button

      URLS = { :production =&gt; &quot;http://www.google.com/&quot; }

      def initialize(browser)
        @browser = browser
        @search_field         = @browser.text_field(:name =&gt; &quot;q&quot;)
        @google_search_button = @browser.button(:name =&gt; &quot;btnG&quot;)
      end

      def method_missing(sym, *args, &amp;block)
        @browser.send sym, *args, &amp;block
      end

      def visit
        @browser.goto URLS[:production]
      end

      def page_title
        @browser.title
      end

      def search_for term
        self.search_field.set term
        self.google_search_button.click
        google_results_page = GoogleResultsPage.new(browser)
        google_results_page.results.wait_until_present if WEBDRIVER
        google_results_page
      end

    end

<strong>Cucumber Initialization</strong>

I have everything to do with initialization in support/env.rb. This initializes a browser <em>once</em>, and then uses the same browser instance for each Cucumber scenario. This is different from Jeff's <code>hooks.rb</code> file that launches a new browser for <em>every</em> scenario. I have found by reusing the browser, you get much quicker test execution time.

The INDEX_OFFSET is a constant that allows me to use 'index' when referring to browser elements across both celerity with its 1-based index and watir-webdriver with its 0-based index.


    TEST_DATA_DIR = &quot;./features/test_data&quot;

    if ENV[&quot;HEADLESS&quot;] then
      require &quot;celerity&quot;
      browser = Celerity::Browser.new
      INDEX_OFFSET = 0
      WEBDRIVER = false
    else
      require 'watir-webdriver'
      require 'watir-webdriver/extensions/wait'
      browser = Watir::Browser.new :firefox
      INDEX_OFFSET = -1
      WEBDRIVER = true
    end

    Before do
      @browser = browser
    end

    at_exit do
      browser.close
    end

<strong>Calling the page objects from the steps</strong>

As you can see, most of my steps are in a <a href="http://watirmelon.com/2010/12/10/cucumber-imperative-or-declarative-that-is-the-question/">declarative style</a>, so these normally align pretty well to a method on the page object.
I use a <strong>given</strong> step to create a page object (in our case @google_home_page), and then call methods on this object for <strong>when</strong> and <strong>then</strong> steps. I have created a dynamic invocation of the page creation, so it will work for all pages specified in the cucumber step itself. I use the <code>search_for_term</code> method to transition between page objects, as this method returns the new page. As a rule of thumb, I try to keep my step definition code to 1 or 2 lines, and at a fairly  high level, which makes it much more readable.

    Given /^I am on the (.+)$/ do |page_name|
      @google_home_page = Object.const_get(page_name.gsub(&quot; &quot;,&quot;&quot;)).new(@browser)
      @google_home_page.visit
    end

    When /^I search for a? ?&quot;([^&quot;]*)&quot;$/ do |term|
      @google_results_page = @google_home_page.search_for term
    end

    When /^I search for a?n? ?([^&quot;].+[^&quot;])$/ do |term|
      term = Common.get_search_term_data term
      @google_results_page = @google_home_page.search_for term
    end

    Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
      @google_results_page.number_search_results.should &gt;= exp_num_results.gsub(&quot;,&quot;,&quot;&quot;).to_i
    end

    Then /^I should see at most ([\d,]+) results$/ do |exp_num_results|
      @google_results_page.number_search_results.should &lt;= exp_num_results.gsub(&quot;,&quot;,&quot;&quot;).to_i
    end

    When /^I convert (.+)$/ do |conversion_statement|
      @google_results_page = @google_home_page.search_for &quot;convert #{conversion_statement}&quot;
    end

    Then /^I should see the conversion result &quot;([^&quot;]*)&quot;$/ do |exp_conversion_result|
      @google_results_page.conversion_result.text.should == exp_conversion_result
    end

<strong>Expressing test data external to the features/pages</strong>

Unlike Jeff's recommendation of using <a href="http://www.cheezyworld.com/2010/11/21/ui-tests-default-dat/">default data</a> on page objects, I prefer to store test data externally to the page objects in YAML files. That way I can <strong>describe</strong> the test data which is directly used in my Cucumber step. For example:
<pre>Scenario: Do a search using data specified externally
  Given I am on the Google Home Page
  When I search for a <strong>ridiculously small number of results</strong>
  Then I should see at most 5 results</pre>
The phrase <strong>ridiculously small number of results</strong> matches directly to a section of my YAML test data file. This keeps the scenario highly readable, with the detailed data specified in the YAML file.

    search terms:
      ridiculously small number of results:
        search term: 'macrocryoglobulinemia marvel'

A common method simply retrieves the appropriate test data, and provides it to the step to use. Note here that, as this step <em>doesn't</em> contain quotation marks, this implies a description of data, rather than a literal string of data that would contain quotation marks around the string.

    When /^I search for a?n? ?([^&quot;].+[^&quot;])$/ do |term|
      term = Common.get_search_term_data term
      @google_results_page = @google_home_page.search_for term
    end

<strong>Putting it all together</strong>
I have set up two profiles in the <code>cucumber.yml</code> file, one is the default that uses Firefox under Watir-Webdriver, and one runs Celerity (headless) and is named <code>ci</code>. It's then a case of calling <code>"cucumber"</code> or <code>"cucumber -p ci"</code> to run each of these profiles.

I have set up a <code>./go</code> script that bootstraps the entire process on unix based systems (Mac OSX and Linux).

<strong>The final result</strong>

Running <code>cucumber</code> provides results as <strong>green</strong> as a cucumber.

<a href="http://watirmelon.files.wordpress.com/2011/01/cucumber-results.png"><img class="alignnone size-full wp-image-780" title="Cucumber Results" src="http://watirmelon.files.wordpress.com/2011/01/cucumber-results.png" alt="" width="640" height="245" /></a>

<strong>How does this compare to Cheezy's framework I mentioned?</strong>
<ul>
	<li>I am using a similar <em>page object</em> pattern to define web application pages, but I haven't created a helper class to mix into each like he has: I simply use instance variables on a page class to define the GUI elements, instead of creating a series of methods for each object.</li>
	<li>My page objects also delegate methods to the main Browser object as required, so you can directly call things like .title, .url etc.</li>
	<li>Instead of using Jeff's <em>default data</em> pattern, I instead prefer to store this data described in external YAML files instead for maximum flexibility.</li>
	<li>Jeff talks about using mixins to <a href="http://www.cheezyworld.com/2010/11/13/ui-tests-part-two/">mix in common objects</a>. I haven't done this, but it's easily doable with my framework, and should be done as it scales out.</li>
</ul>
<strong>Summary</strong>

Jeff has done an excellent job with his series of posts and code (thank you), and I am hoping here to build on that, and show how it's easy to set up a simple Cucumber &amp; Watir page object pattern framework.
