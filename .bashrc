if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
export HISTCONTROL=erasedups
export HISTSIZE=10000
export PS1='[\t][\u]['\$CurDir'$(__git_ps1 " (%s)")] \$ '
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=/usr/local/bin:$HOME/.local/bin:$HOME/bin:$PATH
export PATH=/Applications/microchip/mplabc32/v2.02/bin:$PATH
shopt -s histappend
source ~/.git-completion.sh
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
alias polaris='ssh -t jhunt@polaris.cs.wcu.edu screen -dRR'
alias polarisx='ssh -X jhunt@polaris.cs.wcu.edu'
alias q="qlmanage -p"
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
