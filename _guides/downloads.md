---
layout: guide
title: Browser Downloads
permalink: /guides/downloads/
redirect_from: /docs/downloads/
---

Downloads are problematic in Watir because they require interacting with the Operating System,
and Watir automates a Browser, not an OS. As such if any file dialog boxes are displayed,
Watir will be unable to handle them. Especially if you are executing your tests on a remote 
machine, realize that downloads will be sent to that machine, not the machine executing
your Ruby code, which makes retrieving the file effectively impossible.
Additionally, actually validating the content of a file is not trivial, 
especially for something like a PDF.

So, before we get into strategies for dealing with downloads, consider carefully whether you need to 
actually download files in the first place. 

* Is it sufficient to validate that the link is present?
* Can you download the file with a an HTTP Library instead of going through the browser?
* Can you test what you need to in a lower level unit or integration test rather than in the browser?

For more thoughts on this, read 
[this article](http://ardesco.lazerycode.com/testing/webdriver/2012/07/25/how-to-download-files-with-selenium-and-why-you-shouldnt.html).
It is older and focused on Selenium, but the points are still relevant.

If your manager insists you absolutely must test the download via the browser, you can initialize
the Browser object with parameters telling the browser to automatically download files to a 
particular directory rather than prompting the Operating System.

### Firefox

{%  highlight ruby %}
download_directory = "#{Dir.pwd}/downloads"
download_directory.tr!('/', '\\') if Selenium::WebDriver::Platform.windows?

profile = Selenium::WebDriver::Firefox::Profile.new
profile['browser.download.folderList'] = 2 # custom location
profile['browser.download.dir'] = download_directory
profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv,application/pdf'

b = Watir::Browser.new :firefox, profile: profile
{% endhighlight %}

A full list of these Firefox options are available in firefox by typing ‘about:config‘ in the address bar.

If you want to know a way to work out the file types (eg. application/pdf) then you can read the [following blog post](http://watirmelon.com/2011/09/07/determining-file-mime-types-to-autosave-using-firefox-watir-webdriver/) for an step by step guide.

### Chrome

{% highlight ruby %}
prefs = {
  download: {
    prompt_for_download: false,
    default_directory: '/path/to/dir'
  }
}

b = Watir::Browser.new :chrome, options: {prefs: prefs}
{% endhighlight %}

<!--- TODO: Add code examples for other browsers --->
