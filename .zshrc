# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="humza"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Customize to your needs...
export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/texbin:$PATH


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx sublime python pip iterm tmux virtualenvwrapper history-substring-search syntax-highlighting)

export EDITOR=vim
set AUTO_CD

source $ZSH/oh-my-zsh.sh
source $HOME/dev/dotfiles/xgen.sh
# autocomplete
fpath=(/usr/local/share/zsh/site-functions $fpath)
# aliases
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
eval "$(hub alias -s)"
alias gdb='/usr/local/bin/gdb'
alias ls='ls -la -G'
alias cr="python \~/dev/10gen/scratch/tools/upload.py \-y \-s codereview.10gen.com \-m"

# Vim style command editing
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# pip virtualenv support
export PIP_VIRTUALENV=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

if [[ -f "$HOME/.amazon_keys" ]]; then
    source "$HOME/.amazon_keys";
fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
