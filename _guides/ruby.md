---
layout: guide
title: Installing Ruby
permalink: /guides/ruby/
redirect_from: /docs/ruby/
---

### Introduction

In order to run Ruby code you need to install a Ruby interpreter. 

Installing a Ruby interpreter for Windows is straightforward, but for
Mac and Linux it is slightly more complicated. 
The default Ruby interpreters normally supplied on Mac 
and Linux are not adequate for running Watir and
related Ruby technologies without making significant alterations to them.

There are different options for properly maintaining 
a Ruby interpreter, but we have chosen rbenv as the most
suitable Ruby interpreter for Mac and chruby for Linux.  

Note that RVM is an acceptable (if more complicated) way to 
maintain a Ruby interpreter if you prefer to use it,
but if you choose to use rbenv or chruby, be sure to uninstall RVM completely.

### Windows

* Download and install the latest version from [rubyinstaller](https://rubyinstaller.org/downloads/)

### Mac

Hold down the Command key and press the spacebar to open Spotlight search
Type Terminal and hit enter

**Install XCode command-line tools**

Copy and paste this into the terminal and hit enter:

{% highlight shell %}
xcode-select --install
{% endhighlight %}

**Install [HomeBrew](http://brew.sh)**

Copy and paste this into the terminal and hit enter:
{% highlight shell %}
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
{% endhighlight %}

**Install [rbenv](https://github.com/rbenv/rbenv#readme)**

Copy and paste this into the terminal:
{% highlight shell %}
brew install readline rbenv ruby-install
rbenv init
touch ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
{% endhighlight %}

Copy and paste this into the terminal (update version to latest release if desired):
{% highlight shell %}
rbenv install 2.6.5
rbenv local 2.6.5
{% endhighlight %}

### Linux

**Install git**
Copy and paste this into the terminal:
{% highlight shell %}
sudo apt-get install git
{% endhighlight %}

**Install [ruby-install](https://github.com/postmodern/ruby-install#readme)**
Copy and paste this into the terminal:
{% highlight shell %}
wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
tar -xzvf ruby-install-0.6.0.tar.gz
cd ruby-install-0.6.0/
sudo make install
ruby-install ruby 2.5.3
{% endhighlight %}
  
**Install [chruby](https://github.com/postmodern/chruby#readme)**
Copy and paste this into the terminal:
{% highlight shell %}
cd ../
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
sudo ./scripts/setup.sh
xed ~/.bash_profile
{% endhighlight %}

Copy and paste this into the bash_profile file that opened in TextEdit:
{% highlight shell %}
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
{% endhighlight %}
Save file and Close TextEdit

Copy and paste this into the terminal and hit enter:
{% highlight shell %}
source ~/.bash_profile
chruby 2.5.3
{% endhighlight %}
