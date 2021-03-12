---
layout: guide
title: Capabilities
permalink: /guides/capabilities/
modified_date: 2021-03-12
---

***Note: If you are having an issue updating to Watir 6.19, please
[contact us](../../help/#oh-you-mean-you-need-help-with-something) so we can help!***

#### Contents
* [Browser Defaults](#watir-browser-defaults)
* [What the Browser Does](#browser-options)
* [Where Code is Sent](#where-code-is-sent) (driver, server, etc)
* [How Code is Sent](#how-the-code-is-sent)
* [Bonus Features](#bonus-features)
* [Selenium Classes](#selenium-classes)

### Watir Browser Defaults

The default Watir browser, without any arguments, uses Chrome on your
local machine with all of the driver default settings.

The most obvious desired customization is by browser,
which you can pass in as the first argument:
{% highlight ruby %}
Watir::Browser.new # ==> (uses Chrome)
Watir::Browser.new :edge
Watir::Browser.new :firefox
Watir::Browser.new :internet_explorer
Watir::Browser.new :safari
{% endhighlight %}

### Browser Options
**Use the `:options` parameter**

Watir 6.6 tried to make it easier to do everything with `Watir::Capabilities`,
but ended up making a number of edge cases even more difficult.

Watir 6.19 fixes this up by using a more focused API and noting deprecations in preparation for Watir 7.

#### W3C Capabilities
According to the W3C, there are only [10 top-level capabilities](https://w3c.github.io/webdriver/#capabilities)
allowed.
Some of these are set to ensure you are getting the session you want.
Other than browser name, most of these are only useful when using a Selenium Grid or Service.
Note that if you specify any of these, the driver must ensure that everything matches
or else you'll get an error:
* `:browser_name`
* `:browser_version`
* `:platform_name`
* `:set_window_rect`

The remaining capabilities are set to indicate how you want the driver to behave.
* `:accept_insecure_certs` - whether to trust self-signed certificates; defaults to false
* `:page_load_strategy` - what the driver should wait for after a navigation has called
  Important: this only applies to when you are using the `#goto` method, and does not
  have any effect from navigation based on page interactions (like clicking a link)
    * `:none` value - does not wait for anything; Because Watir waits for elements before interacting with them,
      this may speed up your tests without causing additional failures
    * `:eager` value - waits for the document readiness state to be "interactive"; this is probably the best setting
      for most Watir users
    * `:normal` value - this is the default behavior that waits for a document readiness state of "complete'
* `:proxy` - allows user to define a proxy for site traffic to be routed through
* `:timeouts` - Watir users now have more control of setting timeouts.
    * `:implicit` key - do not set a value for this, it will cause problems with Watir's waiting strategy
    * `:script` key - how long to wait for a script to finish executing (default 30 seconds)
    * `:page_load` key - when using the `#goto` method how long to wait for a page to finish loading (default 300 seconds)
* `:strict_file_interactability` - defaults to false; set it to true if you are concerned about your file type input fields
  being visible when using `#upload`
* `:unhandled_prompt_behavior` - what the driver should do when it encounters an Alert
    * `:dismiss` value - Use this if your site has intermittent alerts pop up that your test does not care about and you can't turn off
    * `:accept` value - Use this if your site requires accepting alerts for you to run your tests, and your tests do not care about them
    * `:ignore` value -  If there is an alert on the page and you send any browser command that isn't related to the
      alert, your code will raise an exception. If you rescue the exception, you can continue the test by switching to
      the alert and handling it as desired before continuing. This is the option that provides the most control to the
      user and is therefore the default that Watir sets. Note that this is the only setting that allows you to query
      whether an alert has popped up in a way that doesn't change the state of the alert
    * `:dismiss_and_notify` value - This is the WebDriver default, but Watir overrides it and sets `:ignore`.
      This setting raises the exception just like in `:ignore`, but then automatically dismisses the alert. So
      if you rescue the exception, you don't then have to switch to the alert to manage it, you can directly continue with
      your test. This is the worst of either alternate settings above.
      Either you don't care about whether there is an alert and should use `dismiss`, or you do care about it, and should be
      able to choose what you to about it (`:ignore`).
    * `:accept_and_notify` value - similar to `:dismiss_and_notify` except that the alerts are accepted instead of dismissed
      after raising an exception. It is similarly a bad idea.

W3C Capabilities can be set with the `:options` key as follows:
{% highlight ruby %}
browser_opts = {accept_insecure_certs: true,
                timeouts: {page_load: 100,
                           script: 30},
                page_load_strategy: :eager}
b = Watir::Browser.new :chrome, options: browser_opts
{% endhighlight %}

#### Browser Specific Capabilities
In addition to the W3C Capabilities that all browsers support, each browser vendor has their own list of
settings that can be adjusted.
Check out the details of those specific capabilities in the respective Watir Guides:
* [Chrome](../chrome)
* [Edge](../edge)
* [Firefox](../firefox)
* [Internet Explorer](../ie)
* [Safari](../safari)

An example of using these browser vendor specific capabilities looks like this:
{% highlight ruby %}
browser_opts = {exclude_switches: ['disable-popup-blocking'],
                args: ['start-fullscreen'],
                detach: true}
b = Watir::Browser.new :chrome, options: browser_opts
{% endhighlight %}

Note that you can combine W3C and Browser specific keys in the same Hash:
{% highlight ruby %}
browser_opts = {accept_insecure_certs: true,
                timeouts: {page_load: 100,
                           script: 30},
                page_load_strategy: :eager,
                exclude_switches: ['disable-popup-blocking'],
                args: ['start-fullscreen'],
                detach: true}
b = Watir::Browser.new :chrome, options: browser_opts
{% endhighlight %}

#### Service Provider Capabilities
Service providers have their own capabilities, and they have to use name spaced keywords.
Sauce Labs uses `sauce:options` and BrowserStack uses `bstack:options`.

To add custom service provider capabilities, add a hash of the capabilities inside the provider's
custom keyword, inside the `:options` Hash. Note that since the keyword has a colon, it needs to
have quotes around it. Also note that using a service provider requires specifying their url (more on
that in the next section).
{% highlight ruby %}
browser_opts = {accept_insecure_certs: true,
                timeouts: {page_load: 100,
                           script: 30},
                page_load_strategy: :eager,
                exclude_switches: ['disable-popup-blocking'],
                args: ['start-fullscreen'],
                detach: true,
                'sauce:options': {username: ENV['SAUCE_USERNAME'],
                                  access_key: ENV['SAUCE_ACCESS_KEY'],
                                  name: test_name,
                                  build: build_name,
                                  idle_timeout: 60}}
b = Watir::Browser.new :chrome, options: browser_opts, url: 'https://ondemand.us-west-1.saucelabs.com'
{% endhighlight %}

### Where Code is Sent
**Use the `:url` *or* `:service` parameter**

You can execute tests on your local machine, via a Selenium server (either
locally or on another machine), or via a service provider
(like Sauce Labs or Browser Stack).

To route commands via a server or service provider, simply pass in the location of the
default endpoint with the `:url` parameter:
{% highlight ruby %}
b = Watir::Browser.new :chrome, url: 'https://my-remote-server.com/wd/hub'
{% endhighlight %}

If `:url` is not specified, Watir assumes you want to execute your tests locally.
It will use Selenium code to determine the
[installed driver](../drivers) associated with the chosen Browser, start it up,
and set it to be the recipient of the commands. You can customize how the
driver is started by specifying:
* `:path` - the path of the driver;
* `:port` - the port the driver should start on
* `:args` - the list of command line switches to start the driver with.
  You can get a list of valid arguments by running --help command on
  any driver:

{% highlight bash %}
chromedriver --help
geckodriver --help
msedgedriver --help
safaridriver --help
{% endhighlight %}

An example of setting service arguments with the `:service` parameter is:
{% highlight ruby %}
service_opts = {path: '/path/to/drivers/chromedriver', 
                port: '12345', 
                args: ['--verbose', '--log-path=/path/to/logs/chromedriver.log']}
b = Watir::Browser.new :chrome, service: service_opts
{% endhighlight %}

### How the Code is Sent
**Use the `:http_client` parameter**

The WebDriver protocol is based on using an HTTP client to send JSON packets to various endpoints.
As of Watir 6.19, we are using our own custom client: `Watir:HttpClient`.
All it is doing differently is adding some header information to
indicate to browser services that Watir is being used and including the version.
If you are using your own HttpClient, consider
subclassing the Watir one, or
[tell us]([contact us](../../help/#oh-you-mean-you-need-help-with-something)
what you'd like to see us add.

The settings that can be adjusted for the HTTP Client are:
* `:read_timeout` - the amount of time to wait for data to be received
* `:open_timeout` - the amount of time to wait for a connection to be opened

These both default to 60 seconds in `Watir:HttpClient`.

An example of setting service parameters is:
{% highlight ruby %}
client_opts = {read_timeout: 120,
               open_timeout: 30}
b = Watir::Browser.new :chrome, http_client: client_opts
{% endhighlight %}

### Bonus Features

Watir wants to provide more convenience functionality than Selenium by default.
As such, we're going to provide "special" features that generate the
underlying capabilities for common things that people might be interested in.
If there are things you want to see here let us know.

#### Headless
Headless mode is supported in Chrome & Firefox. You can turn on headless by
sending the following:

{% highlight ruby %}
b = Watir::Browser.new :chrome, headless: true
{% endhighlight %}
or
{% highlight ruby %}
b = Watir::Browser.new :firefox, headless: true
{% endhighlight %}

Caveats:
* A headless browser isn't a "full" browser, so not all features may work
* It is unlikely to speed up your tests by much in most cases
* You will get an error if you specify `:headless` on a browser that does not support it

#### Safari Technology Preview

See the [Safari Guide](../safari)
for details on why you would want to use this setting.

{% highlight ruby %}
b = Watir::Browser.new :safari, technology_preview: true
{% endhighlight %}
* You will get an error if you set this with any browser other than Safari

### Selenium Classes
While we recommend using Hashes and letting Watir convert things for you,
you are more than welcome to use Selenium classes directly as necessary:

#### Driver
{% highlight ruby %}
driver = Selenium::WebDriver::Chrome::Driver.new
b = Watir::Browser.new(driver)
{% endhighlight %}

#### Options
{% highlight ruby %}
options = Selenium::WebDriver::Chrome::Options.new
b = Watir::Browser.new(:chrome, options: options)
{% endhighlight %}

#### Capabilities
Note: `Capabilities` should only be used if you want to specify the exact
JSON for the driver to receive, without any conversions (e.g., keywords are camelCase and `String` instances, etc)
{% highlight ruby %}
capabilities = Selenium::WebDriver::Remote::Capabilities.chrome
b = Watir::Browser.new(:chrome, options: capabilities)
{% endhighlight %}

#### Service
{% highlight ruby %}
service = Selenium::WebDriver::Chrome::Service.new
b = Watir::Browser.new(:chrome, service: service)
{% endhighlight %}

#### HttpClient
{% highlight ruby %}
client = Selenium::WebDriver::Remote::Http::Default.new
b = Watir::Browser.new(:chrome http_client: client)
{% endhighlight %}


<!--- TODO: Link to other guides with browser specific info --->

<!--- 
* Certificates
* Downloads
* Headless
* Mobile Emulation?
* Proxies
-->
