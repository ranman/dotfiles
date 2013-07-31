#!/usr/bin/env zsh
for f in .{zshrc,aliases,exports,functions,emacs,slate,gitconfig,tmux.conf,gitignore,rvmrc}; do
    [ -e "$f" ] && ln -fs $PWD/$f $HOME/$f
done
