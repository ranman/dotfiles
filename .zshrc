export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:~/bin:/usr/texbin:$PATH

# autocomplete
fpath=(/usr/local/share/zsh/site-functions $fpath)
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/Users/ranman/.zshrc'
autoload -Uz compinit
compinit
set show-all-if-ambiguous on
set completion-ignore-case on

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ranman"
plugins=(git osx sublime python iterm history-substring-search syntax-highlighting virtualenvwrapper)
source $ZSH/oh-my-zsh.sh

for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# amazon API keys
if [[ -f "$HOME/.amazon_keys" ]]; then
    source "$HOME/.amazon_keys";
fi

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1


fortune | cowsay
