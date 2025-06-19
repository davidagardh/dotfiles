if type -q starship
    starship init fish | source
else
    echo "Starship is not installed"
end
