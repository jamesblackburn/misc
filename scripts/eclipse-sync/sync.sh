#!/bin/bash

# A simple script to ‘git cvsimport’ tracked Eclipse CVS repositories
# Followed by pushing the tracked repos. to github

# Location of cvsps needed for importing this repos

export PATH=/Users/james/bin/cvsps-2.1/:$PATH

if [ $# -eq 0 ]; then
  DIRS=`ls`
else
  DIRS=$@
fi
  
for DIR in $DIRS; do
  if [ -d $DIR ]; then
    echo Running git cvs-import for: $DIR
    ./$DIR-cvsimport.sh
    pushd $DIR
    # Pushing tracked branch to github CVS_HEAD
    for  BRANCH in `cat ../$DIR.branch` ; do
       echo Synching: $BRANCH
       git push github $BRANCH
    done
    popd
    echo
  fi 
done
