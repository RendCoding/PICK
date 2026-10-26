# PICK — Personal Interactive Command Kernel

**Your terminal. Your language. Your rules.**

PICK is a Bash-based personal command launcher and interactive command workspace. It brings custom commands, backups, guided utilities, recipes, missions, and local extension packs into one `pick` command.

> **Status:** early public release, version `0.1.8`. Expect rough edges; please report bugs and include your distro, Bash version, and the command/output involved.

## Features

- **Command registry** — maintain personal commands in `~/.config/pick/commands.tsv`.
- **Backups** — create, list, explore, and restore PICK backups.
- **Command Centre** — a central interactive entry point.
- **Personal actions and recipes** — save and launch actions and command recipes.
- **Missions** — organise multi-step workflows with confirmation before execution.
- **Doctor and repair guidance** — diagnose PICK and review recommendations; repair guidance does not automatically change the system.
- **Theme profiles** — preview theme-related settings; applying themes is not implemented yet.
- **Audio inspection** — inspect audio devices using available system utilities.
- **Local extension packs** — manage local packs; PICK does not download or automatically execute extensions.
- **Optional shell-manager integration** — calls `pickshell`, `addshell`, `delshell`, or `searchshell` when those commands are installed.

Some interactive features depend on tools available on your system. PICK does not install system dependencies for you.

## Requirements

- Bash
- Standard Linux command-line utilities
- Optional utilities are detected at runtime for specific features (for example, `fzf`, `wpctl`, or a graphical file manager)

PICK is designed for user-level installation and does not require `sudo` for the included installer.

## Install

### From a downloaded source archive

1. Download and extract the source archive.
2. Open a terminal in the extracted `PICK` directory.
3. Run:

   ```bash
   chmod +x install.sh
   ./install.sh
   ```

The installer checks Bash syntax, backs up an existing `~/.local/bin/pick` and command registry when present, then installs the script atomically to `~/.local/bin/pick`.

Ensure `~/.local/bin` is in your `PATH`. The installer does not change your shell configuration automatically.

### From a Git clone

After publishing this repository, clone it and run the same installer:

```bash
git clone https://github.com/ YOUR-USERNAME/PICK.git
cd PICK
chmod +x install.sh
./install.sh
```

Replace `YOUR-USERNAME` with the GitHub account or organisation that hosts the repository.

## Quick start

```bash
pick -help
pick -version
pick -V
pick doctor
pick centre
```

Useful areas to explore:

```bash
pick config       # edit custom command registry
pick backup       # create a backup
pick backup -l    # list backups
pick memory       # recipes and saved command knowledge
pick mission      # multi-step workflows
pick repair       # review repair recommendations
pick extension    # local extension packs
```

Use `pick -help` for the command list supported by your installed version. Some commands may offer interactive subcommands; follow their displayed usage.

## Configuration and data

- Command registry: `${XDG_CONFIG_HOME:-~/.config}/pick/commands.tsv`
- Backups: `${XDG_DATA_HOME:-~/.local/share}/pick/backups/`
- Executable: `~/.local/bin/pick`

The command registry uses this format:

```text
name|description|command
```

Only add commands you trust. Custom command entries are executed by Bash, so they can run with the same permissions as your user account.

## Safety notes

- Review custom commands before running them; registry entries are trusted shell commands.
- Missions and saved recipes require confirmation before execution.
- Repair provides recommendations and does not perform automatic system changes.
- Extension packs are local-only and are not downloaded or auto-executed.
- Theme application remains preview-only.
- The installer backs up the existing PICK script and, if present, the command registry before replacing the script.
- PICK does not need root privileges for its own installation. Individual commands you choose to run may have their own effects and permissions.

## Development checks

Before submitting a change, run:

```bash
bash -n pick
bash -n install.sh
```

Please test interactive behaviour on your own setup as well. Automated smoke checks cannot cover every desktop environment or optional dependency.

## Contributing

Bug reports, small fixes, and documentation improvements are welcome. Please include:

- Linux distribution and Bash version
- PICK version (`pick -version`)
- The command you ran and the exact output
- Whether the relevant optional dependencies are installed

Avoid including personal paths, tokens, passwords, or other sensitive data in issue reports.

## Version history

See [CHANGELOG.md](CHANGELOG.md).

## License

PICK is distributed under the MIT License. See [LICENSE](LICENSE).
