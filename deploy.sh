#!/bin/bash

# https://ayastreb.me/deploy-jekyll-to-github-pages-with-travis-ci/
# https://gist.github.com/domenic/ec8b0fc8ab45f39403dd

set -e # Exit with nonzero exit code if anything fails

function doCompile {
  bundle exec jekyll build
}

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
    echo "Skipping deploy; just doing a build."
    doCompile
    exit 0
fi

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

echo "cleanup _site"
rm -rf _site
mkdir _site

echo "Clone the existing code for this repo into _site/"
git clone $REPO _site

echo "Build content with Jekyll"
doCompile

echo "Set Git information"
touch deploy_key
cd _site
git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

# If there are no changes to the compiled out (e.g. this is a README update) then just bail.
if git diff --quiet; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi

echo "Commit the changes"
# The delta will show diffs between new and old versions.
git add -A .
git commit -m "Deploy Generated Content from Travis ${TRAVIS_BUILD_NUMBER}: ${SHA}"

# Get the deploy key by using Travis's stored variables to decrypt deploy_key.enc
ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}

echo "Create the Key"
openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in ../deploy_key.enc -out ../deploy_key -d

echo "Set permissions for the Key"
chmod 600 ../deploy_key

echo "SSH Add key"
eval `ssh-agent -s`
ssh-add ../deploy_key

echo "Push to Repo"
git push $SSH_REPO