if type -q go
    go env -w GOPATH=$HOME/Development/go
    set -gx PATH $HOME/Development/go/bin $PATH
end
