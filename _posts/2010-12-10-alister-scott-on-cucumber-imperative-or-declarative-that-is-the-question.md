---
layout: post
title: Alister Scott on 'Cucumber - imperative or declarative? that is the question'
date: 2010-12-10 09:42
author: bpettichord
comments: true
categories: [ATDD, Blogs, Cucumber, Declarative, Imperative, RSpec, Ruby]
---
<strong>Guest post by <a href="http://watirmelon.com">Alister Scott</a></strong>

<hr />

I've recently been putting some amount of thought into how to write good Cucumber features. One the reasons I love Cucumber so much is its language focus; meaning it makes you think about things like <a href="http://en.wikipedia.org/wiki/Sentence_function">sentence function</a> more than other testing frameworks I have used. One element of sentence function usage in Cucumber that's important is whether you should write <em>imperative</em> (communicative) or <em>declarative </em>(informative) sentences for your steps. I'll provide a couple of examples to show the differences.

<strong>An imperative (communicative) Cucumber scenario</strong>

[sourcecode language="text"]
Scenario: Submit the form with correct data (imperative)
  Given I am on the watir example form
  When I set &quot;What is your name?&quot; to &quot;Alister&quot;
  And I set &quot;What is your story?&quot; to &quot;I like ruby&quot;
  And I set &quot;What testing tool do you like?&quot; to &quot;Watir&quot;
  And I click &quot;Submit&quot;
  Then I should see the message &quot;Thanks! Your response has been recorded.&quot;
[/sourcecode]

Each step is a command, or instruction, so it's pretty clear what is being done.

<strong>A declarative (informative) Cucumber scenario</strong>

[sourcecode language="text"]
Scenario: Submit the form with correct data (declarative)
  Given I am on the watir example form
  When I submit the form with correct data
  Then I should see the correct message
[/sourcecode]

Each step states an idea, so sometimes it's not really clear precisely what is being done.

<strong>Imperative vs Declarative</strong>

There's some quite good articles about writing Cucumber features/scenarios around. One such <a href="http://benmabey.com/2008/05/19/imperative-vs-declarative-scenarios-in-user-stories.html">article</a> that stood out to me was written in May 2008 about RSpec Story Runner, and whether you should use an imperative or declarative style. The answer is, of course, it depends, but most people tend to lean towards the declarative style, just the way that a lot of programmers prefer <a href="http://en.wikipedia.org/wiki/Declarative_programming">declarative programming</a>. I am actually swinging towards imperative style cucumber features and steps; the reasons for which I will explain below.

<strong>Running Imperative Features gives you richer output</strong>

With the two examples above, I have kinda cheated, in that the step definitions for the declarative style calls imperative steps. For example, this is the declarative step defintion:

[sourcecode language="ruby"]
When /^I submit the form with correct data$/ do
  When &quot;I set \&quot;What is your name?\&quot; to \&quot;Alister\&quot;&quot;
  And &quot;I set \&quot;What is your story?\&quot; to \&quot;I like ruby\&quot;&quot;
  And &quot;I set \&quot;What testing tool do you like?\&quot; to \&quot;Watir\&quot;&quot;
  And &quot;I click \&quot;Submit\&quot;&quot;
end
[/sourcecode]

This is all well and good, as you can now have multiple cucumber steps that call the same thing, it's <a href="http://en.wikipedia.org/wiki/Don%27t_repeat_yourself">DRY</a>ish, but the problem is when you run the step "When I submit the form with correct data", that's all you get.

<a href="http://watirmelon.files.wordpress.com/2010/12/declarative-results.png"><img class="alignleft size-full wp-image-563" title="declarative results" src="http://watirmelon.files.wordpress.com/2010/12/declarative-results.png" alt="" width="640" height="156" /></a>

Compare this to the imperative step results, which whilst calling exactly the same code, give you a lot more richness.

<a href="http://watirmelon.files.wordpress.com/2010/12/imperative-results.png"><img class="alignleft size-full wp-image-564" title="imperative results" src="http://watirmelon.files.wordpress.com/2010/12/imperative-results.png" alt="" width="640" height="167" /></a>

<strong>Writing imperative scenarios allow you to utilise things advanced cucumber functionality</strong>

Two table based Cucumber features I like using are <a href="https://github.com/aslakhellesoy/cucumber/wiki/scenario-outlines">scenario outlines</a>, and <a href="https://github.com/aslakhellesoy/cucumber/wiki/multiline-step-arguments">multiline step arguments</a>, but these don't make a lot of sense if you're using a declarative style.
For example, the imperative scenario could be easily adapted to use a scenario outline, whereas the declarative style would mean writing more declarative steps.

[sourcecode language="text"]
Scenario Outline: Submit the form with correct data (imperative - outline)
  Given I am on the watir example form
  When I set &quot;What is your name?&quot; to &quot;&quot;
  And I set &quot;What is your story?&quot; to &quot;&quot;
  And I set &quot;What testing tool do you like?&quot; to &quot;&quot;
  And I click &quot;Submit&quot;
  Then I should see the message &quot;Thanks! Your response has been recorded.&quot;

  Examples:
   | name    | story       | tool     |
   | Alister | I Like ruby | Watir    |
   | Mozart  | I like java | Selenium |
[/sourcecode]

<strong>Writing declarative scenarios often means hidden detail</strong>

As you move to more and more declarative scenarios, more and more details become hidden in cucumber step definitions and library code. As <a href="http://www.software-testing.com.au/blog/2010/08/31/does-cucumber-suck/comment-page-1/#comment-1153">Rasmus pointed out</a> on Jared Quinert's blog on <a href="http://www.software-testing.com.au/blog/2010/08/31/does-cucumber-suck/">does Cucumber suck</a>:
<blockquote>...tests end up looking like the <em>one test to rule them all</em>™:
Given everything is set up
When I submit correct data
Then everything should be OK</blockquote>
<strong>Summary</strong>

To wrap up, I'm not saying don't go declarative, what I am saying is that you lose certain things in Cucumber when you do, but whether this is a big deal or not depends on what you're trying to get out of it. In the meantime, I'll continue to experiment and see what works and what doesn't.

Original article: <a href="http://watirmelon.com/2010/12/10/cucumber-imperative-or-declarative-that-is-the-question/">http://watirmelon.com/2010/12/10/cucumber-imperative-or-declarative-that-is-the-question/</a>
