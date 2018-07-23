#!/bin/bash

# https://ayastreb.me/deploy-jekyll-to-github-pages-with-travis-ci/
# https://gist.github.com/domenic/ec8b0fc8ab45f39403dd

set -e # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="source"
TARGET_BRANCH="master"

function doCompile {
  bundle exec jekyll build
}

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Skipping deploy; just doing a build."
    doCompile
    exit 0
fi

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}

echo "Make sure source doesn't have _site data"
rm -rf _site

echo "Clone the existing code for this repo into _site/"
git clone $REPO _site

echo "Check out non-default branch"
cd _site
git checkout $TARGET_BRANCH
cd ..

echo "Build content with Jekyll"
doCompile

echo "Set Git information"
cd _site
git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

# If there are no changes to the compiled out (e.g. this is a README update) then just bail.
if git diff --quiet -- . ':(exclude)*.xml'; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi

echo "Commit the changes"
# The delta will show diffs between new and old versions.
git add -A .
git commit -m "Deploy Generated Content from Travis Build ${TRAVIS_BUILD_NUMBER}"

echo "Set permissions for the Key"
chmod 600 ../deploy_key

echo "SSH Add key"
eval `ssh-agent -s`
ssh-add ../deploy_key

echo "Push to Repo to master"
git push $SSH_REPO $TARGET_BRANCH
