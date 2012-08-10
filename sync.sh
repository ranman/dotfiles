#!/usr/bin/env zsh
for f in .*
do
    [ -f "$f" ] && ln -s $f $HOME/$f
done
