# fish loads config in this order:
#   1. conf.d/*.fish, in alphabetical order
#   2. config.fish (this file)
#
# Functions go in functions/<name>.fish, one per file. fish loads each one
# the first time it's called, so they cost nothing at startup.
# `funced <name>` followed by `funcsave <name>` writes the file for you.
#
# Avoid universal variables (`set -U`, or `fish_add_path` without --path).
# They're saved in fish_variables, which is per-machine and not synced.
