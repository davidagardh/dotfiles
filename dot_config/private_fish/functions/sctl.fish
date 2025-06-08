function sctl
    if set -q DISTROBOX_ENTER_PATH
        host-spawn sudo systemctl
    else
        sudo systemctl
    end
end
