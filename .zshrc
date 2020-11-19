export PATH="/usr/local/opt/ruby/bin:/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$HOME/bin:$PATH"
export HISTSIZE=1000000

autoload -Uz compinit && compinit

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ranman"
plugins=(
    git
    osx
    history-substring-search
    shrink-path
)
source $ZSH/oh-my-zsh.sh

for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

fortune | cowsay


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ranman/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ranman/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ranman/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ranman/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(rbenv init -)"

precmd() {
    email="ranman@fb.com"
    [[ $PWD =~ .*/dev/fb.*$ ]] && { export GIT_COMMITTER_EMAIL=$email && export GIT_AUTHOR_EMAIL=$email; } || { unset GIT_COMMITTER_EMAIL && unset GIT_AUTHOR_EMAIL; }
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
