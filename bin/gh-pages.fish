#!/usr/bin/fish

## before script do next:
# cd /tmp
# mkdir clean-dir; cd clean-dir/
# git init
# git remote add origin git@github.com:daggerok/ember.git
# git checkout -b gh-pages
# echo "# github pages branch" > README.md
# git add README.md
# git commit -am init
# git push origin gh-pages
## cd back into project dir

npm i; npm run ghpages
#sed -i -e "s/\(<base href=\"\/\">\)/<base href=\"\/ember\/\"\/>/g" dist/index.html
# dist/ -> #dist/
sed -i -e 's/^dist\/$/#dist\//g' .gitignore
touch dist/.nojekyll
echo "script: echo test" > dist/.travis.yml
cp -Rf dist/index.html dist/404.html
cp -Rf README.md dist/
cp -Rf bin/api dist/
git add .
git commit --amend --no-edit
#git push origin (git subtree split --prefix=dist --onto=origin/gh-pages):gh-pages --force
git push --delete origin gh-pages
git subtree push --prefix dist origin gh-pages
git rm -r dist --cached
# #dist/ -> dist/
sed -i -e 's/^#dist\/$/dist\//g' .gitignore
git add .
git commit --amend --no-edit
git push origin master --force
