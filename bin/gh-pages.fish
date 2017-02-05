#!/usr/bin/fish

npm i; npm run ghpages
#sed -i -e "s/\(<base href=\"\/\">\)/<base href=\"\/ember\/\"\/>/g" dist/index.html
# update .gitignore: dist/ -> #dist/
sed -i -e 's/^dist\/$/#dist\//g' .gitignore
touch dist/.nojekyll
echo "script: echo test" > dist/.travis.yml
cp -Rf dist/index.html dist/404.html
cp -Rf README.md dist/
cp -Rf bin/api dist/
git add .
git commit --amend --no-edit
##git push origin (git subtree split --prefix=dist --onto=origin/gh-pages):gh-pages --force
#git push --delete origin gh-pages
#git subtree push --prefix dist origin gh-pages
git push origin (git subtree split --prefix dist/ master):gh-pages --force
git reset --hard origin/master
