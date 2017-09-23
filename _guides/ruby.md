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

There are different options for supplying
a good Ruby interpreter, but we have chosen rbenv as the most
suitable Ruby interpreter.  

Note that rbenv cannot exist on the same system as RVM.
RVM is an acceptable Ruby interpreter if you prefer to use it,
but if you prefer to use rbenv, be sure to uninstall RVM 
completely.


### Windows
* Download and install the latest version from [rubyinstaller](https://rubyinstaller.org/downloads/)
<br />
<br />

### Mac

**Install [HomeBrew](http://brew.sh)**

Hold down the Command key and press the spacebar to open Spotlight search
Type Terminal and hit enter

Copy and paste this into the terminal and hit enter:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**Install [rbenv](https://github.com/rbenv/rbenv#readme)**

Copy and paste this into the terminal:
```
brew install rbenv
rbenv init
touch ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

Copy and paste this into the terminal:
```
rbenv install 2.4.1
rbenv local 2.4.1
```
<br />

### Linux

**Install git**
Copy and paste this into the terminal:
```
sudo apt-get install git
```

**Install [ruby-install](https://github.com/postmodern/ruby-install#readme)**
Copy and paste this into the terminal:
```
wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
tar -xzvf ruby-install-0.6.0.tar.gz
cd ruby-install-0.6.0/
sudo make install
ruby-install ruby 2.4.1
```
  
**Install [chruby](https://github.com/postmodern/chruby#readme)**
Copy and paste this into the terminal:
```
cd ../
wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install
sudo ./scripts/setup.sh
xed ~/.bash_profile
```

Copy and paste this into the bash_profile file that opened in TextEdit:
```
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
```
Save file and Close TextEdit

Copy and paste this into the terminal and hit enter:
```
source ~/.bash_profile
chruby 2.4.1
```