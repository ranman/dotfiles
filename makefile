all: git tmux vim zsh
clean: git_clean tmux_clean vim_clean zsh_clean

PWD = $(shell pwd)

# GIT
git: gitconfig gitignore
GIT = $(PWD)/git/

gitconfig:
		ln -s $GIT/gitconfig ~/.gitconfig

gitignore:
		ln -s $(GIT)/gitignore_global ~/.gitignore_global

git_clean:
		mv ~/.gitconfig ~/.gitconfig.old
		mv ~/.gitignore_global ~/.gitignore_global.old

# TMUX

tmux: tmux.conf
TMUX = $(PWD)/tmux/

tmux.conf:
		ln -s $(TMUX)/tmux.conf ~/.tmux.conf

tmux_clean:
		mv ~/.tmux.conf ~/.tmux.conf.old

# VIM

vim: vimdir vimrc
VIM = $(PWD)/vim/

vimdir:
		ln -s $(VIM) ~/.vim

vimrc: vimdir
		ln -s ~/.vim/vimrc ~/.vimrc

vim_clean:
		mv ~/.vim/ ~/.vim.old
		mv ~/.vimrc ~/.vimrc.old

