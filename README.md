# Watir Website

The [Watir Website](http://watir.com) is generated from the code in this repository using [Jekyll](https://github.com/jekyll/jekyll)

The code is in the `source` branch, and updates to it are built by Travis CI and the resulting static site
files are stored in the `master` branch, which Github serves for us.

### Contributing
Please help us keep our examples and tutorials up to date. 
These guides can be found in the `_guides` directory

Do you have Watir specific information you'd like to share?
Create a post in the `_posts` directory

If you know Jekyll / HTML / CSS and would like to help improve our
site's look and feel, by all means contact us.

### Example Pages
HTML used for Watirspecs is mirrored on the Watir site in the /examples directory
To update this code with the latest in the watir repository:
```git
$ git remote add -f -t master --no-tags watirhtml https://github.com/watir/watir.git
$ git rm -rf examples
$ git read-tree --prefix=examples/ -u watirhtml/master:spec/watirspec/html
```