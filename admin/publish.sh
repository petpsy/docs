#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
export PYTHONUNBUFFERED=1
export PATH=/opt/miniconda3/envs/venv-py3/bin:$PATH

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
rm -rf docs
cd docfx_project
docfx ./docfx.json

if [ $? -eq 0 ]; then
    mv _site ../docs
fi

git add --all
git commit -m "Update docs"
git push origin master