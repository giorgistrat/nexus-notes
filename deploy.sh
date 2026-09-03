#!/bin/bash
# Rebuild the Quartz site from the Nexus vault and republish it to GitHub Pages.
set -e
cd "$(dirname "$0")"

npx quartz build

cd public
rm -rf .git
git init -q
git config user.name "giorgistrat"
git config user.email "giorgiberiashvili.social@gmail.com"
git add -A
git commit -q -m "Deploy site $(date -u +%Y-%m-%dT%H:%M:%SZ)"
git branch -M gh-pages
git remote add origin https://github.com/giorgistrat/nexus-notes.git
git push -f origin gh-pages

echo "Deployed to https://giorgistrat.github.io/nexus-notes/"
