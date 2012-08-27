xgen() {
    # without an argument just goto the directory
    if [ -z "$1" ]; then
        cd $HOME/dev/10gen
    # if the path in the argument exists goto it
    elif [ -d "$HOME/dev/10gen/${1}" ]; then
    	cd "$HOME/dev/10gen/${1}"
    else
        # otherwise we move to the directory and attempt to clone
        # the repo from $2 argument
    	cd $HOME/dev/10gen
        git clone git@github.com:${2}/${1}.git
        cd $1
    fi
}
