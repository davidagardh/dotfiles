status is-interactive; or exit

abbr --add g "git"
abbr --add gs "git status"
abbr --add gf "git fetch"
abbr --add gp "git pull"
abbr --add gP "git push"
abbr --add gpf "git push --force-with-lease"
abbr --add ga "git add"
abbr --add gc "git commit"
abbr --add gcm "git commit -m"
abbr --add gcam "git commit -am"
abbr --add gt "git stash"
abbr --add gtp "git stash pop"
abbr --add grb "git rebase"
abbr --add gm "git merge"
abbr --add gl "git log --oneline --graph"
abbr --add gb "git branch"
abbr --add gsw "git switch"
abbr --add gw "git worktree"
abbr --add gwa "git worktree add"
abbr --add gwr "git worktree remove"
abbr --add gcl "git clone"
abbr --add gclb "git clone --bare"
abbr --add gwf "git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'"
abbr --add gd "git diff"
abbr --add gr "git restore"
abbr --add gu "git restore --staged"
abbr --add grst "git reset"

abbr --add cz "chezmoi"
abbr --add czapp "chezmoi apply"

abbr --add occ "oc config current-context"
abbr --add ocsw "oc config use-context"
abbr --add ocl "oc login --web --server api.okd.dsek.se:6443"


# ... → ../.., .... → ../../.. and so on
function _abbr_dots
    string repeat -n (math (string length -- $argv[1]) - 1) ../ | string trim --right --chars /
end
abbr --add dots --position anywhere --regex '^\.\.\.+$' --function _abbr_dots

# !! → the previous command
function _abbr_last_command
    echo -- $history[1]
end
abbr --add !! --position anywhere --function _abbr_last_command

# !$ → the last argument of the previous command
function _abbr_last_arg
    set -l tokens (commandline --input "$history[1]" --tokens-raw)
    set -q tokens[1]; or return 1
    echo -- $tokens[-1]
end
abbr --add '!$' --position anywhere --function _abbr_last_arg
