#!/bin/bash
export VERSION=$(grep '# color' colormake.pl |cut -f3 -d\ )

mkdir -p tmp
ln -s $(pwd) tmp/colormake-$VERSION
(cd tmp && tar chvfz colormake-$VERSION.tar.gz \
                     --exclude=tmp --exclude=.git --exclude=*.tar.gz \
                     colormake-$VERSION)
mv tmp/*.tar.gz .
rm -rf tmp

echo
echo 'Press ENTER to push to github and Klaki... [CTRL+C to abort]'
read

ln README.md README.txt
scp colormake-$VERSION.tar.gz *.txt \
    bre@klaki.net:public_html/programs/colormake/
rm -f README.txt

git tag -f $VERSION
git push
git push --tags
