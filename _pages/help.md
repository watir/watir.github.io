---
layout: page
title: Help
permalink: /help/
---

### You want to help us? That's great news!

Watir is maintained by volunteers, and we welcome and appreciate contributions.

* Want to add or fix things on this website? Make a pull request to 
[our website code](https://github.com/watir/watir.github.io). 
* Want to help write Watir code? We suggest you start by running the test suite on the project
to learn what things Watir is doing.
* Want to suggest ideas for how to make Watir better? Submit an 
[issue](https://github.com/watir/watir/issues) with your feature request.

### Oh, you mean you need help with something?

#### Do you have a reproducible problem with Watir code?

Submit an [issue](https://github.com/watir/watir/issues) or, even better, figure out what the problem is and submit a
 [pull request](https://github.com/watir/watir/pulls) with the fix.

#### Do you have a specific error or difficulty that has a practical answer of general interest?

Post a Question on [StackOverflow](http://stackoverflow.com/questions/tagged/watir). Several
 people in the Watir community actively monitor questions asked there that have the watir tag.

#### Do you have a question that involves an opinion, or is otherwise not of general interest?

Send a question to the [Watir-General](https://groups.google.com/forum/#!forum/watir-general) mailing list on Google Groups.

#### Is it easiest to just have a conversation with us?

Join the #watir channel on the Selenium Slack account.
 You can join by submitting [this form](http://seleniumhq.herokuapp.com). 
 You will be sent an invitation with instructions on how to join.

### Guidelines for Questions and Posts

* Check the above locations to see if your question has already been asked before posting your question
* Keep your questions on-topic
    * Questions must be related to Watir or testing questions in general
    * Watir is for testing not web-scraping, so questions specific to scraping are off-topic
    * Consider finding a more appropriate forum to ask your non-Watir-specific question: 
        * [Selenium Users Group](https://groups.google.com/forum/#!forum/selenium-users)
        * [Ruby Resources](https://www.ruby-lang.org/en/community/)
        * [Cucumber Support](https://cucumber.io/support)
* Be Respectful
    * The people answering your questions are volunteers with real jobs. Watir has a wonderful and helpful
    community, but people do not owe you an immediate answer. Be patient, we'll eventually be able
    to help.
    * Use standard English, not SMS or chat speak
* Be Specific and Thorough
    * Provide a [Short, Self Contained, Correct Example](http://sscce.org/)
    * Include all of the relevant versions for specific issues you are having (Watir, Selenium, driver, browser, Ruby, etc)
    * Include the relevant HTML and the Watir code you are using
    * If you are getting an error, provide the full stack trace (you might need to run your tests with 
    `--backtrace`)
    * If asked to provide logs: `Selenium::WebDriver.logger.level = :debug` and `Watir.logger.level = :debug` can
    be very helpful in tracking down your issue
