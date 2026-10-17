status is-interactive; or exit

if type -q zoxide
    zoxide init fish | source
    abbr --add cd z
end
