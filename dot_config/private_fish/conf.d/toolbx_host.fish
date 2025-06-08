function _host_spawn
    set cmd $argv[1]
    abbr -a $cmd "host-spawn $cmd"
end

if set -q DISTROBOX_ENTER_PATH
    _host_spawn podman
    _host_spawn buildah
    _host_spawn flatpak
    _host_spawn rpm-ostree
    _host_spawn ostree
    _host_spawn bootc
    _host_spawn tmux
end

