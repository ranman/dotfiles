xgen() {
    xgenpath="$HOME/dev/10gen"
    # without an argument just goto the directory
    if [ -z "$1" ]; then
        cd $xgenpath
    # if the path in the argument exists goto it
    elif [ -d "${xgenpath}/${1}" ]; then
    	cd "${xgenpath}/${1}"
    else
        # otherwise we move to the directory and attempt to clone
        # the repo from $2 argument
    	cd $xgenpath
        git clone git@github.com:${2}/${1}.git
        cd $1
    fi
}
