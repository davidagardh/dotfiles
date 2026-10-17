# fish_add_path skips directories that don't exist, so it's fine to list
# tools that are only installed on some machines. --path changes $PATH for
# this session only, instead of saving it to fish_variables.
fish_add_path --path ~/.bun/bin ~/.crc/bin/oc ~/.local/bin ~/bin
fish_add_path --path --append ~/.local/share/coursier/bin ~/.cargo/bin
