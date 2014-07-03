export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:~/bin:/usr/texbin:~/.cabal/bin:$PATH

# autocomplete
fpath=($HOME/.zsh-completetions /usr/local/share/zsh/site-functions $fpath)
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/Users/ranman/.zshrc'
autoload -Uz compinit
compinit
set show-all-if-ambiguous on
set completion-ignore-case on

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ranman"
plugins=(git brew osx sublime python iterm history-substring-search syntax-highlighting aws cabal docker fabric mvn virtualenvwrapper)
source $ZSH/oh-my-zsh.sh

for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# amazon API keys
if [[ -f "$HOME/.amazon_keys" ]]; then
    source "$HOME/.amazon_keys";
fi

fortune | cowsay
