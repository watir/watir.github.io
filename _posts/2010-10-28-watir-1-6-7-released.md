---
layout: post
title: Watir 1.6.7 released
date: 2010-10-28 06:36
author: bpettichord
comments: true
categories: [1.6.7, Releases]
---
Hello, everyone!

Watir 1.6.7 got just released!
<!--more-->
<strong>General improvements</strong>
<ul>
	<li> added new waiting methods for Watir::Element: #when_present, #wait_until_present and #wait_while_present (Jari Bakken and Jarmo Pertman)</li>
	<li>added new waiting methods for Watir::IE and Watir::Firefox: #wait_until and #wait_while (Jari Bakken and Jarmo Pertman)</li>
	<li>added method #present? for Watir::Element (Jari Bakken and Jarmo Pertman)</li>
	<li>deprecated old waiting methods in Watir::Waiter which will be removed in some future version - use Watir::Wait instead (Jarmo Pertman)</li>
</ul>
<strong>IE improvements</strong>
<ul>
	<li> removed Watir::Simple (Željko Filipin)</li>
	<li>#click_no_wait was not working with frame elements. Closes<a href="http://jira.openqa.org/browse/WTR-459" target="_blank"> http://jira.openqa.org/browse/WTR-459</a> (Jarmo Pertman)</li>
</ul>
<strong>Firefox improvements</strong>
<ul>
	<li> get_attribute_value now works with attributes named something like "foo-bar" (Alan Shields)</li>
</ul>
<strong>Cleanup &amp; Maintenance</strong>
<ul>
	<li> cleaned up repo at GitHub</li>
	<li>merge licenses into one (Željko Filipin)</li>
	<li>Rakefile works now under non-Windows systems too (Alan Shields)</li>
	<li>Removed datahandler.rb (Charley Baker)</li>
</ul>
Install it with:
<code>
gem install watir
</code>
And run your existing tests.

If you're seeing any problems then don't forget to open a ticket at JIRA (<a href="http://jira.openqa.org/browse/WTR" target="_blank">http://jira.openqa.org/browse/WTR</a>) or fork the project on GitHub
(<a href="http://github.com/bret/watir" target="_blank">http://github.com/bret/watir</a>) and send us a pull request with the fix!
If you have any problems installing Watir, then read more detailed instructions at <a href="http://watir.com/installation/" target="_blank">http://watir.com/installation/</a>

~ Watir Development Team
