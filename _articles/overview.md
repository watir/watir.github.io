---
layout: article
title: Automation Pipeline
permalink: /articles/overview/
redirect_from: /docs/overview/
---

Watir is a user focused way to test your websites. It mostly uses Selenium for
browser automation, but it provides many more high level features that make
it easy to write stable, maintainable tests.

The typical flow of information looks like this: 

Test Runner --> <br />
&nbsp; &nbsp; &nbsp; 
Test code --> <br /> 
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 
PageObject code --> <br /> 
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 
Watir library-->  <br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 
Selenium library -->  <br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 
Selenium Server(s) (optional) --> <br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 
Browser Driver -->  <br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 
Browser
                        
1. **Test Runner.** In Ruby this can be MiniTest, RSpec or Cucumber. Most Watir users use RSpec
by default, but Cucumber is popular for teams that are working in a Behavior Driven Development
environment.

2. **Test Code.** Whether Cucumber Steps or RSpec "it" blocks, the code here should be
focused on succinctly representing the business requirement for the test. This is the
higher level "what" code that references other objects (like page objects) for the actual implementation.
Ruby is more readable than most langauges, so name page objects and methods well 
and a quick skim will allow to the purpose of the test to be easily understood.

3. **Page Object.** This is where the implementation ("how") code belongs. 
Page objects can represent an entire page, 
a modal, or a subset of a page (like a sidebar or a footer). 
Page objects are typically comprised of two things, the elements with their applicable locators,
and the methods that represent the actions that a user can take on the page.
Most of this code will be references to Watir objects.

4. **Watir Code.** Watir is designed for "Test Automation." It takes the code 
in a page object and translates
it into the series of applicable Selenium and JavaScript calls to accomplish the desired
functionality. Watir attempts to understand the intention of the code in a test suite
and tries to follow a "Do What I Mean" philosophy to accomplish it. Continue reading 
through the documentation to see how Watir makes writing tests fun and easy.

5. **Selenium Code.** Selenium is designed for "Browser Automation." It takes the higher focuses on the 
specific low level actions that can be taken on a browser. 
It implements a small number of locators and takes a "Do What I Say" approach.
It translates idiomatic Ruby code into serialized json blobs to send along for further processing.

6. **Selenium Server.** This isn't necessary when driving browsers on the same computer as the code.
To drive browsers on a remote computer, though, the commands need to be sent to one or more intermediary
 servers. The Selenium server can be set to act in a standalone mode, or can be set up as 
a grid with a server acting as a "hub" on one computer, and a server acting as a "node" on another computer.

7. **Browser Drivers.** Because of the progress on the [W3C WebDriver Specification](https://w3c.github.io/webdriver/webdriver-spec.html), 
each major browser vendor (Google, Microsoft, Apple, and Mozilla) has committed to 
implementing their own driver for their respective browser. The driver is an executable
file that lives on the same machine as the browser that is being automated. Read the 
[Drivers documentation](../drivers) to see how to download and store the driver so that
Selenium can find and use it. The driver accepts the standardized information from Selenium 
code and translates it into code needed by the particular browser to take the action specified.

8. **Browser.** The browser of your choice executes each command sent by the driver, and sends the results or errors
back down this path to the test code.
