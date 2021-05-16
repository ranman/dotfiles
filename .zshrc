# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit && compinit

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:/usr/local/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$HOME/bin:$PATH"
export HISTSIZE=1000000


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(osx)
source $ZSH/oh-my-zsh.sh

for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


precmd() {
    email="ranman@fb.com"
    [[ $PWD =~ .*/dev/fb.*$ ]] && { export GIT_COMMITTER_EMAIL=$email && export GIT_AUTHOR_EMAIL=$email; } || { unset GIT_COMMITTER_EMAIL && unset GIT_AUTHOR_EMAIL; }
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(jump shell)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
function toggle-right-prompt() { p10k display '*/right'=hide,show; }
zle -N toggle-right-prompt
bindkey '^P' toggle-right-prompt
