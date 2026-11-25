# davidagardh's Dotfiles

My configuration files for Linux systems.

## Installation

This repo is managed using [chezmoi](https://www.chezmoi.io/). It only depends on git being installed and can be quickly installed using this one-liner

`sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin init --apply davidagardh`

## Layout

| Path | Contents | Deployed by |
| --- | --- | --- |
| `home/` | chezmoi source state (see `.chezmoiroot`) | `chezmoi apply` copies it into `~` |
| `nvim/` | Neovim config | `~/.config/nvim` is a symlink to it |
| `fish/` | fish config | `~/.config/fish` is a symlink to it |
| `toolbox-ansible/` | Ansible playbook for the `toolbx` container | A weekly systemd timer from `home/dot_config/systemd` |
| `agent-box/` | Contanerfiles to build isolated environments for AI agents | Built by github actions, used by quadlets in `home/dot_config/containers/systemd` |

## Day-to-day use

- **nvim and fish** are symlinked, so edit them in place or in this repo. Anything that writes to those directories shows up in `git status`, like lazy.nvim updating `lazy-lock.json` or `funcsave` adding a function.
- **Everything else** is copied. Change it with in this repo or using `chezmoi edit <file>`. If something changed a deployed copy directly, `chezmoi apply` will warn about it. Use `chezmoi status` and `chezmoi diff` show it, and `chezmoi re-add` to pull the change back into the repo.
- **Syncing**: commit and push, then pull and `chezmoi update` on the other machines.

## Git

Shared config lives in `~/.config/git/config`. `~/.gitconfig` is machine-local: chezmoi creates it once and never touches it again. Tools that run `git config --global` (VS Code, git-lfs, `gh auth setup-git`) write there, so they can't cause sync conflicts.

## Shell

I use [fish](https://fishshell.com/) with the [starship](https://starship.rs/) prompt.

- `fish/conf.d/*.fish` runs at every startup, in alphabetical order. Use one file per topic.
- `fish/functions/<name>.fish` holds one function per file. Each one loads the first time it's called. `funced <name>` and then `funcsave <name>` writes the file for you.
- `nodejs` and `pnpm` come from Fedora's repos. If a project declares a Node runtime in `devEngines.runtime` or `engines.runtime`, pnpm downloads it and uses it for `pnpm run` and `pnpm exec`. A plain `engines.node` field is only a compatibility check, and bare `node` uses the system version.

bash and vim have small configs for machines that don't have fish and Neovim.

## Neovim

Nvim config based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). It uses [Lazy](https://github.com/folke/lazy.nvim) to manage plugins.

### Java (course setup)

Java support lives in one file, `nvim/lua/plugins/java.lua`: the jdtls language
server, the java-debug adapter for nvim-dap, JUnit test running/debugging, and
SpotBugs.
`nvim/lua/plugins/scala.lua` no longer claims `java` files, so Metals and jdtls
don't both start.

The first time a Java file is opened, Mason installs `jdtls`,
`java-debug-adapter`, and `java-test` automatically. This needs a JDK on
`PATH` (`java-latest-openjdk-devel` from the playbook is fine). Maven, Gradle,
and plain Eclipse projects (`.classpath` + `.project`, source in `src/`, classes
in `bin/`) work out of the box; jdtls uses its embedded build tool support.

| Key | Action |
| --- | --- |
| `<F5>` | Start/continue debugging |
| `<leader>b` | Toggle breakpoint |
| `<F1>` / `<F2>` / `<F3>` | Step into / over / out |
| `<F7>` | Toggle the debug UI (variables, stack, breakpoints, REPL) |
| `<leader>ja` | Launch the current main class with program arguments |
| `<leader>jt` | Debug the test method under the cursor |
| `<leader>jT` | Debug the test class |
| `<leader>jp` | Pick a test to debug |
| `<leader>jo` | Organize imports |
| `<leader>jg` | Generate tests |
| `<leader>jc` | Set a conditional breakpoint (prompts for condition) |
| `<leader>jf` | Drop to frame (restart the current frame) |
| `<leader>jw` | Add/watch an expression |
| `<leader>js` | Run SpotBugs and load findings into quickfix |

For programs with `main(String[] args)`, open the source file and use
`<leader>ja` (or `:JavaLaunch`). It launches the main class in that file and
prompts for the arguments. With the course examples: from `fib.java` enter `5`;
from `InsertionSorter.java` enter `12 5 9 3 2 25 8 19 200 10`. Arguments can
also be given on the command line, for example `:JavaLaunch 5` or
`:JavaLaunch 12 5 9 3 2 25 8 19 200 10`.

A `.vscode/launch.json` in the project is the persistent alternative; nvim-dap
reads it when you press `<F5>`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "java",
      "name": "InsertionSorter test case",
      "request": "launch",
      "mainClass": "InsertionSorter",
      "args": "12 5 9 3 2 25 8 19 200 10",
      "cwd": "${workspaceFolder}"
    }
  ]
}
```

The debug UI (`<F7>`) also supports the Eclipse-style interactions directly:

- **Scopes:** `<CR>` expands values, `e` edits a variable's value while
  stopped, `w` adds the variable to the watches pane, `r` sends it to the REPL.
- **Breakpoints:** `t` enables/disables the selected breakpoint, `d` deletes
  it, `o` jumps to it.
- **Stacks:** `o` jumps to the selected frame.

For JUnit, put the cursor in a test method and press `<leader>jt`; breakpoints
are honored and results are printed to the `dap-repl` buffer.

#### SpotBugs

Neovim has built-in SpotBugs support; no extra Lua plugin is needed. Install
the SpotBugs CLI and put `spotbugs` on `PATH`, then compile the project and run
`<leader>js` (or `:JavaSpotBugs`). Findings are loaded into the quickfix list.
The Maven and Gradle source/class directories are configured automatically.

For a local install:

```sh
curl -fsSL https://github.com/spotbugs/spotbugs/releases/download/4.10.5/spotbugs-4.10.5.tgz |
  tar -xz -C ~/.local/share
ln -sfn ~/.local/share/spotbugs-4.10.5/bin/spotbugs ~/.local/bin/spotbugs
```

This is not a full Eclipse replacement: it analyzes the classes for the
current buffer, reports through quickfix instead of live editor markers, and
requires the project to be compiled first. For whole-project reports, running
the SpotBugs Maven/Gradle plugin and opening its report is still an option.

To remove the course setup afterwards: delete
`nvim/lua/plugins/java.lua`, add `'java'` back to the `ft` list in
`nvim/lua/plugins/scala.lua` if Metals should cover Java again, then run
`:Lazy clean`. `:MasonUninstall jdtls java-debug-adapter java-test` removes the
tools if they are no longer needed; a manually installed SpotBugs CLI can be
removed separately.

## YubiKey

[drduh YubiKey Guide](https://github.com/drduh/YubiKey-Guide/)

Setting up a new machine for SSH and gpg:

1. `ssh -K`
1. (`sudo systemtl restart pcscd`)
1. `gpg --edit-card`  
    `> fetch`
