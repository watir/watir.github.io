---
layout: page
title: Drivers
permalink: /docs/drivers/
---

As described in the [Automation Pipeline](../overview) document, a driver
must be present on the same machine as the browser you are automating.

If you are running locally, you can use the [webdrivers gem](https://github.com/titusfortner/webdrivers)
to automatically ensure that the latest driver is downloaded, and placed in a location
where Selenium can access it.

Otherwise, you can download the drivers for the browser of your choice:
* Google Chrome: [chromedriver](https://sites.google.com/a/chromium.org/chromedriver/downloads)
* Mozilla Firefox: [geckodriver](https://github.com/mozilla/geckodriver/releases)
* Microsoft Edge: [Microsoft WebDriver](https://github.com/mozilla/geckodriver/releases)
* Microsoft Internet Explorer: [IEDriver](http://docs.seleniumhq.org/download)
* Apple Safari: safaridriver (no download needed, it's pre-installed if you have Safari 10)

For all browsers except for Safari, you then need to move the driver onto your PATH. 
This can be especially tricky in Windows.

Alternately, you can avoid dealing with drivers entirely and use an online service 
provider to manage everything for you.
* [Sauce Labs](https://www.saucelabs.com)
* [Browser Stack](https://www.browserstack.com)