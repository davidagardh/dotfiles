# nvm installs Node per shell. Add the default version's bin directory to
# PATH directly instead of sourcing nvm.sh, which is bash-only and slow.
set -gx NVM_DIR ~/.config/nvm

if test -s $NVM_DIR/alias/default
    set -l default_version (cat $NVM_DIR/alias/default)
    set -l bin $NVM_DIR/versions/node/$default_version/bin

    if test -x "$bin/node"
        fish_add_path --path $bin
        set -gx NVM_BIN $bin
        set -gx NVM_INC (path normalize $bin/../include/node)
    else
        # The default alias isn't a full version (lts/*, 22, ...), so let nvm
        # resolve it. This costs a bash startup, but only for such aliases.
        nvm use default >/dev/null 2>&1
    end
end
