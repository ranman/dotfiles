#!/usr/bin/env zsh
for f in .*
do
    [ -f "$f" ] && ln -fs $PWD/$f $HOME/$f
done
ln -fs $PWD/.ssh/config $HOME/.ssh/config
