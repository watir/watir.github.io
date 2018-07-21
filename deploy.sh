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

echo "cleanup _site"
rm -rf _site
mkdir _site

echo "Build content with Jekyll"
doCompile

echo "Set Git information"
git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

echo "Commit the changes"
git add --force _site/
git commit -m "Deploy Generated Content from Travis Build ${TRAVIS_BUILD_NUMBER}"

# Get the deploy key by using Travis's stored variables to decrypt deploy_key.enc
ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}

echo "Create the Key"
openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in deploy_key.enc -out deploy_key -d

echo "Set permissions for the Key"
chmod 600 deploy_key

echo "SSH Add key"
eval `ssh-agent -s`
ssh-add deploy_key

echo "Push to Repo"
git push $SSH_REPO
