function sctl
    if set -q DISTROBOX_ENTER_PATH
        host-spawn sudo systemctl $argv
    else
        sudo systemctl $argv
    end
end
