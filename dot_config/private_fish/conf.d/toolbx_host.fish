function _host_spawn
    set cmd $argv[1]
    abbr -a $cmd "host-spawn $cmd"
end

if test -f /run/.toolboxenv
    _host_spawn podman
    _host_spawn buildah
    _host_spawn flatpak
    _host_spawn rpm-ostree
    _host_spawn ostree
    _host_spawn bootc
    _host_spawn tmux
    abbr -a systemctl "host-spawn sudo systemctl"
end

