---
layout: page
title: Watir History
permalink: /history/
---

Watir grew out of Ruby code written by Chris Morris in 2001 to control Internet Explorer through its 
[COM interface](https://en.wikipedia.org/wiki/Component_Object_Model).(<strong>[1](https://web.archive.org/web/20040611154239/http://www.clabs.org/wtr/index.cgi?page=/AboutWtr)</strong>) 
This library was called cliec. In 2003 Bret Pettichord and Brian Marick began using this code as the basis for a
course they were teaching on test automation. Inspired by this course, but needing something capable of working
with more advanced websites, Paul Rogers created his own library and called it WTR (Web Testing in 
Ruby).(<strong>[2](https://github.com/watir/watir-classic/commit/aca359)</strong>) This library had more functionality
 but a poorer API. Bret and Paul got together at the 
[Agile XP conference](https://web.archive.org/web/20041013084540/http://www.xpuniverse.com:80/schedule/T15)
in August of 2004 to take the best parts of cliec and WTR and created a cleaner API using 
[TDD principles](https://en.wikipedia.org/wiki/Test-driven_development).(<strong>[3](https://web.archive.org/web/20041011114632/http://www.io.com/~wazmo/blog/archives/2004_08.html)</strong>) 
The first commit with the new name is from September 30, 2004.(<strong>[4](https://github.com/watir/watir-classic/commit/7c7a8a)</strong>) 

From the earliest days of the project Watir has had people dedicated to building a community around it.
This endeavor has been mostly independent from writing the code. Early on this was handled by Jonathan Kohl 
who took on the role of writing the initial documentation, creating code examples and guides in addition to
general promotion. Other people filling this role over the years includes Chris McMahon, Zeljko Filipin,
Alister Scott, and David McNulla. 

Bret joined ThoughtWorks in 2004 and was introduced
to the work Jason Huggins was doing with leveraging JavaScript in the browser for testing using
a program that was initially called JavaScriptTestRunner,
and would eventually became known as 
Selenium.(<strong>[5](https://web.archive.org/web/20140519003122/http://rubyforge.org/pipermail/wtr-general/2004-August/000228.html)</strong>) 
Fun fact: Jason made a list of potential names for his project, but when ThoughtWorks needed
to present an agenda that included discussing this technology at a conference in Australia, Jason wasn't
available to provide the official name. Paul Hammant and Bret looked at the list, 
and Bret's background in the QA community caused him to recognize the humor in calling the project
Selenium. The primary expensive commercial UI testing solution at the time was owned by 
[Mercury Interactive](https://en.wikipedia.org/wiki/Mercury_Interactive) 
and Selenium is known to be a [cure for Mercury poisoning](https://www.ncbi.nlm.nih.gov/pubmed/1304229).
Jason returned to find his project named for him, but it's certainly proved to be an excellent brand name.

Original versions of Selenium were focused on being a test framework with its own HTML table based 
Domain Specific Language (DSL). It had some technological limitations and issues with flexibility, 
as well as offering multiple ways of doing similar things. Its big advantage was its support
for all of the various browsers that were starting to steal market share from Microsoft. 
To keep up with Selenium, various groups created browser specific projects for Watir including
[FireWatir](https://github.com/facebookarchive/watir), 
[OperaWatir](https://github.com/operasoftware/operawatir), 
[SafariWatir](https://github.com/redsquirrel/safariwatir), and
[ChromeWatir](https://github.com/jijeshmohan/chromewatir)).

Selenium also had the advantage of easily supporting development in multiple programming languages. 
As a result, Watir was also adapted into Java with [Watij](https://sourceforge.net/projects/watij/) and
.NET with [Watin](https://www.codeproject.com/Tips/658947/Watin-An-Automation-Testing-in-NET).

WebDriver was created by Simon Stewart in 2007 (also at ThoughtWorks at that time) and it provided
solutions to some of the major issues Selenium faced. Rather than applying a single 
JavaScript implementation for all browsers, it required creating a unique driver for each browser
that would have more power and flexibility. The code base boasted a cleaner API and was less of a testing
framework than a toolkit of direct browser automation 
commands.(<strong>[6](http://www.seleniumhq.org/about/history.jsp)</strong>) 

As the WebDriver drivers matured, Selenium found the WebDriver solutions appealing enough to agree to 
merge the projects.
While Selenium 2.0 effectively emulated Selenium 1.0 (RC) for backward compatibility, adopting WebDriver’s 
object oriented driver approach required significant code updates.
Since Watir had always used the "driver" approach, Watir users ironically had much fewer adjustments to make in
their code than Selenium users did in order to be able to leverage the full power of WebDriver.

When Jari Bakken, a Watir developer, was exposed to WebDriver in 2009, he began developing a Ruby implementation of it 
for both Selenium and Watir. Jari had already written [Celerity](https://github.com/jarib/celerity), 
a JRuby project to implement a wrapper for HtmlUnit, to provide a headless testing option with the same API as Watir. 
With his work on watir-webdriver, he decided to take the Celerity specs and make them usable for both 
projects.([7](https://github.com/watir/watirspec/tree/9443ea77ab998b4f676a120221b460dcab421933)). 
In doing so he created the WatirSpec repository which could be used by any of the Ruby-based projects that 
implemented the Watir API.

The functionality being provided by WebDriver caused the Watir team to add features and change its conventions 
when it made sense to do so. The big backward-incompatible change in the [Watir 2.0](http://watir.com/watir-2-0/) 
(released in August of 2011) was the move from one-indexing to zero-indexing. 
Indexing “like a person” makes sense until you have to constantly figure out if you are working with a 
Watir Collection or a Ruby Array (or with WebDriver). The challenge of bringing Watir into complete 
compliance with the WatirSpec was taken up by Jarmo Pertman and culminated in the release 
of [Watir 3.0](http://watir.com/watir-3-released/) in April 2012.

To encourage the use of watir-webdriver, Hugh McGowan renamed the Watir code base “watir-classic” and 
created a ["meta" repository](https://github.com/watir/watir_meta#about) that would default to using 
the watir-classic implementation for Internet Explorer and using the watir-webdriver implementation 
for all other browsers. This code was implemented by Jarmo and released as Watir 4.0 in Sepetember 2012.

In January of 2015 Jari decided to step down as maintainer of the selenium-webdriver and watir-webdriver
gems.(<strong>[8](https://groups.google.com/forum/#!msg/selenium-developers/h2Ie4FNHmq4/OBsaatq5y6gJ)</strong>).
Alex Rodionov had been an active contributor for the previous three years and took over primary ownership of
the project with assistance from Titus Fortner who was working with Bret at Blackbaud at that time
and had just been officially added to the development team.

With Microsoft releasing the Edge browser and announcing that no new features would be added
to Internet Explorer, the need for the watir-classic code to be actively maintained dramatically diminished.
Also at this time there was significant confusion around what Watir was and what gems should be used; it was not
uncommon for Watir users to say they were running with "Watir WebDriver, not Watir." Since the tester-focused
API has always been the key distinguishing feature for Watir, not the implementation, the project needed
to refocus and disambiguate. In 2016 Titus spearheaded this move, deprecating both watir-classic and watir-webdriver
gems and releasing Watir 6.0 with a new logo, a new website and an updated version of the Selenium-backed code. 
Based on numerous conversations with Bret about the original ideology behind Watir, Titus updated Watir to become
less like an alternative implementation of Selenium, and to more fully leverage the Watir API to 
remove extra configurations and add default waiting behaviors that better adhered to the original spirit of Watir. 

All of this is to say that instead of being a competitor to Selenium, the current version of
Watir relies on the Selenium code for the browser automation capabilities of WebDriver. Think of
Selenium as a Browser Automation Library and Watir as a Test Automation Library. Selenium provides
the means for a user to interact with a browser with a "do what I say" approach,
whereas Watir leverages Selenium to allow a user to accomplish a "do what I mean" approach to testing
the UI.
