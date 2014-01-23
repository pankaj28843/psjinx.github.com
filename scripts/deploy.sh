#!/usr/bin/sh

cd $(git rev-parse --show-toplevel);
jekyll build --lsi --future --drafts;
cd _site;
git add -A $(git rev-parse --show-toplevel);
git commit -am "Generated on `date`"
git push;
cd ..;
