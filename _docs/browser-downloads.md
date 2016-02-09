---
layout: docs
title: Browser Downloads
permalink: /docs/browser-downloads/
---

The easiest and best way of dealing with file downloads is to avoid the pesky file download dialogs altogether.
This is done by programatically telling the browser to automatically save files to a certain directory, that your test can access.

### Firefox

{%  highlight ruby %}
download_directory = "#{Dir.pwd}/downloads"
download_directory.gsub!("/", "\\") if Selenium::WebDriver::Platform.windows?

profile = Selenium::WebDriver::Firefox::Profile.new
profile['browser.download.folderList'] = 2 # custom location
profile['browser.download.dir'] = download_directory
profile['browser.helperApps.neverAsk.saveToDisk'] = "text/csv,application/pdf"

b = Watir::Browser.new :firefox, :profile => profile
{% endhighlight %}

A full list of these Firefox options are available in firefox by typing ‘about:config‘ in the address bar.

If you want to know a way to work out the file types (eg. application/pdf) then you can read the [following blog post](http://watirmelon.com/2011/09/07/determining-file-mime-types-to-autosave-using-firefox-watir-webdriver/) for an step by step guide.

### Chrome

{% highlight ruby %}
download_directory = "#{Dir.pwd}/downloads"
download_directory.gsub!("/", "\\") if  Selenium::WebDriver::Platform.windows?

profile = Selenium::WebDriver::Chrome::Profile.new
profile['download.prompt_for_download'] = false
profile['download.default_directory'] = download_directory

b = Watir::Browser.new :chrome, :profile => profile
{% endhighlight %}

See a full list of Chrome [preferences](http://codesearch.google.com/codesearch#OAMlx_jo-ck/src/chrome/common/pref_names.cc&exact_package=chromium)
