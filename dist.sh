#!/bin/bash
export VERSION=$(grep '# color' colormake.pl |cut -f3 -d\ )

mkdir -p tmp
ln -s $(pwd) tmp/colormake-$VERSION
(cd tmp && tar chvfz colormake-$VERSION.tar.gz colormake-$VERSION \
                     --exclude=tmp --exclude=.git --exclude=*.tar.gz)

ln README tmp/README.txt
scp tmp/*.tar.gz tmp/*.txt bre@klaki.net:public_html/programs/colormake/

mv tmp/*.tar.gz .
rm -rf tmp


