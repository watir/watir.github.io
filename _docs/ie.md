---
layout: page
title: Internet Explorer
permalink: /docs/ie/
---

### IEDriverServer

To use Internet Explorer, ensure you're [using the appropriate driver](../docs/drivers).
Note that for technical reasons it is recommended to *always* use the 32 bit version of the driver,
regardless of your operating system.

### Starting IE

{% highlight ruby %}
b = Watir::Browser.new :ie
{% endhighlight %}

### Configuring IE

Internet Explorer is Windows only and only works if you ensure that Protected Mode settings for each zone are set to the same value.
Additional set up suggestions can be found [here](https://github.com/SeleniumHQ/selenium/wiki/InternetExplorerDriver#required-configuration)

###Internet Explorer Options

Watir uses your standard IE settings and config, so you can manually adjust IE to how you want it before running your tests, 
and it will pick up these settings.

If you want to customize it in your code here are valid options:

* :args           
* :browser_attach_timeout
* :element_scroll_behavior
* :full_page_screenshot
* :ensure_clean_session
* :file_upload_dialog_timeout
* :force_create_process_api
* :force_shell_windows_api
* :ignore_protected_mode_settings
* :ignore_zoom_level
* :initial_browser_url
* :native_events
* :persistent_hover
* :require_window_focus
* :use_per_process_proxy
* :validate_cookie_document_type

{% highlight ruby %}
args = ["--log-level=DEBUG", "--log-file=/foo"]
Watir::Browser.new :ie, options: {args: args}
{% endhighlight %}
