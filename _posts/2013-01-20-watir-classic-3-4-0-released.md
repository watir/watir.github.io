---
layout: post
title: Watir-Classic 3.4.0 Released!
date: 2013-01-20 04:00
author: bpettichord
comments: true
categories: [Releases]
---
<a title="By böhringer friedrich (Own work) [CC-BY-SA-2.5 (http://creativecommons.org/licenses/by-sa/2.5)], via Wikimedia Commons" href="http://commons.wikimedia.org/wiki/File%3ATauTropfenGerbera1.JPG"><img width="256" alt="TauTropfenGerbera1" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/6e/TauTropfenGerbera1.JPG/256px-TauTropfenGerbera1.JPG" /></a>

Hello everyone!

I'm happy to announce that Watir-Classic 3.4.0 has been released!

Put it into your Gemfile:

<code>gem "watir-classic", "~&gt; 3.4.0"</code>

Or install it manually with:

<code>gem install watir-classic</code>

Biggest change is a complete documentation overhaul. Check it out at <a href="http://rubydoc.info/github/watir/watir-classic/frames">rubydoc.info/github/watir/watir-classic/frames</a>

Other changes:

<ul>
<li>All deprecated methods will print out warnings.</li>
<li><code>Element#flash</code> returns <code>self</code> instead of <code>nil</code>.</li>
<li>Fix frame locator in <code>Frame#attach_command</code> (issue #45).</li>
<li>Remove <code>:zero_based_indexing</code> option - from now on all index options are starting from zero.</li>
<li>Remove global variable <code>$HIDE_IE</code> - use <code>IE.visible=</code> method instead. Support for command line switch <code>-b</code> is also removed.</li>
<li>Remove global varialbe <code>$FAST_SPEED</code> - use <code>IE.speed=</code> method instead. Support for command line switch <code>-f</code> is also removed.</li>
<li>Remove <code>IE#close_all</code> - use <code>browser.windows.each(&amp;:close)</code> instead.</li>
<li>Remove <code>IE#close_modal</code> - use <code>browser.modal_dialog.close</code> instead. </li>
<li>Remove <code>IE#close_others</code> - use <code>browser.windows.reject(&amp;:current?).each(&amp;:close)</code> instead.</li>
<li>Remove unused <code>ie-new-process.rb</code>.</li>
<li>Remove unused <code>PageContainer</code> module.</li>
<li>Remove unused <code>PageContainer#check_for_http_error</code>.</li>
<li>Remove unused <code>PageContainer#enabled_popup</code> - use <code>browser.modal_dialog</code> instead.</li>
</ul>



<p>
