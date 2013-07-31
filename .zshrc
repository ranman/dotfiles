export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/texbin:$PATH

for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ranman"
plugins=(git osx sublime python iterm history-substring-search syntax-highlighting virtualenvwrapper)


source $ZSH/oh-my-zsh.sh

# amazon API keys
if [[ -f "$HOME/.amazon_keys" ]]; then
    source "$HOME/.amazon_keys";
fi

fortune | cowsay
