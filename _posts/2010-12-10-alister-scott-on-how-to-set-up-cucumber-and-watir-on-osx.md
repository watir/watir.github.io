---
layout: post
title: Alister Scott on 'How to set up Cucumber and Watir on OSX'
date: 2010-12-10 09:54
author: bpettichord
comments: true
categories: [Blogs, Cucumber, Firewatir, osx, Watir]
---
<strong>Guest post by <a href="http://watirmelon.com">Alister Scott</a></strong>

<hr />

These are the steps I had to use to get Cucumber and Watir running on OSX. It's a shame about step 1, it's a real pain but I don't know any way around it.
<ol>
	<li>Install Xcode from OSX installation DVD - this takes about 15 minutes</li>
	<li>Open a command prompt and use enter the following commands.</li>
	<li><code>sudo gem update --system</code></li>
	<li><code>sudo gem install rspec --no-rdoc --no-ri</code></li>
	<li><code>sudo gem install gherkin --no-rdoc --no-ri</code></li>
	<li><code>sudo gem install cucumber --no-rdoc --no-ri</code></li>
	<li><code>sudo gem install firewatir --no-rdoc --no-ri</code></li>
</ol>
You should be good to go.

See original post: <a href="http://watirmelon.com/2010/12/09/how-to-set-up-cucumber-and-watir-on-osx/"> http://watirmelon.com/2010/12/09/how-to-set-up-cucumber-and-watir-on-osx/ </a>
