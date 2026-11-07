# nvm is a bash function. Run it in bash with this shell's PATH, then copy the
# Node version it selects back into fish. This keeps the official nvm install
# (and its versions) usable from fish without bass or a plugin.
function nvm --description "Run nvm and update this shell's Node version"
    set -l dir $NVM_DIR
    test -n "$dir"; or set dir ~/.config/nvm

    if not test -s $dir/nvm.sh
        echo "nvm: not installed in $dir" >&2
        return 1
    end

    # Start bash with the same PATH as this shell, so nvm sees the version
    # that is active here. Write the resulting node path to a temp file.
    set -l tmp (mktemp)
    set -lx NVM_DIR $dir
    set -lx PATH $PATH
    bash -c '
        unset NPM_CONFIG_PREFIX
        . "$NVM_DIR/nvm.sh" --no-use
        out=$1
        shift
        nvm "$@"
        rc=$?
        nvm which current >"$out" 2>/dev/null
        exit $rc
    ' -- $tmp $argv
    set -l rc $status

    set -l node (cat $tmp 2>/dev/null)
    rm -f $tmp

    # Drop any nvm-managed Node from PATH, then add the one nvm selected.
    set -l dirs (string split : -- (string join : $PATH) | string match -v -- "$dir/versions/node/*/bin")
    if test -n "$node"; and test -x "$node"
        set -l bin (path dirname $node)
        if string match -q -- "$dir/versions/node/*/bin/node" $node
            set -gx NVM_BIN $bin
            set -gx NVM_INC (path normalize $bin/../include/node)
        else
            set -e NVM_BIN
            set -e NVM_INC
        end
        if not contains -- $bin $dirs
            set dirs $bin $dirs
        end
    else
        set -e NVM_BIN
        set -e NVM_INC
    end

    set -gx PATH $dirs
    return $rc
end
