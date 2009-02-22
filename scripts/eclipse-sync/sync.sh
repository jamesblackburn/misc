#!/bin/bash

# A simple script to ‘git cvsimport’ tracked Eclipse CVS repositories
# Followed by pushing the tracked repos. to github

for DIR in `ls`; do
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
