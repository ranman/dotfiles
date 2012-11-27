#!/usr/bin/env zsh
for f in .*
do
    [ -f "$f" ] && ln -fs $PWD/$f $HOME/$f
done
ln -sf $PWD/.ssh/config $HOME/.ssh/config
ln -sf $PWD/post-cmmit /usr/local.share/git-core/templates/hooks/post-commit
