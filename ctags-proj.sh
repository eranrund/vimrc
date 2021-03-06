#!/bin/sh

if [ -f ".ctags.srclist" ]; then
  ctags --python-kinds=-i -R --exclude='.git' --exclude=node_modules -L .ctags.srclist
else
  HERE=$PWD
  cd ..
  if [ "$PWD" = "$HERE" ]; then
    echo "Got to /, have not found your project root, abort!"
    exit 1
  fi
  exec "$0"
fi
# EOF
