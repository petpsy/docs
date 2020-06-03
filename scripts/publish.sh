#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
SITE=$baseDir/../docs
# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
rm -rf $SITE
rm -rf obj
docfx build -o $SITE ./docfx.json
if [ $? -eq 0 ]; then
    echo "build succ"
    mv $SITE/_site/* $SITE
    git add --all
    git commit -m "Update docs"
    git push origin master
fi
