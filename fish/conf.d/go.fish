if type -q go
    set -gx GOPATH ~/Development/go
    fish_add_path --path $GOPATH/bin
end
