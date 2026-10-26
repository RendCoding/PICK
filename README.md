# PICK — Personal Interactive Command Kernel

**Your terminal. Your language. Your rules.**

PICK is a Bash project I’m building to make my terminal feel more personal and useful. It brings custom commands and a collection of interactive tools together under one command: `pick`.

This is an early public release, so some parts are still rough and a few features are not finished yet. If you try it and find a bug, please open an issue and include your Linux distribution, Bash version, and the command/output that caused it.

## What it can do

- Keep personal commands in a command registry.
- Create, browse, and restore PICK backups.
- Open the interactive Command Centre.
- Save and run personal actions and command recipes.
- Organise multi-step workflows as missions, with confirmation before execution.
- Check PICK and show repair suggestions.
- Preview theme-related settings. Applying themes is not implemented yet.
- Inspect audio devices using available system tools.
- Manage local extension packs. PICK does not download or automatically run extensions.
- Work with the optional `pickshell` tools if they are installed.

Some features use optional programs such as `fzf`, `wpctl`, or a graphical file manager. PICK won’t install system dependencies for you.

## Install

PICK is intended to install to your home directory, so the installer itself does not need `sudo`.

### Install from a downloaded archive

1. Download the source ZIP and extract it.
2. Open a terminal in the extracted `PICK` folder.
3. Run:

   ```bash
   chmod +x install.sh
   ./install.sh
   ```

The installer checks the Bash scripts, backs up an existing PICK executable and command registry if present, then installs `pick` to `~/.local/bin/pick`.

Make sure `~/.local/bin` is in your `PATH`. The installer does not edit your shell configuration for you.

### Install from GitHub

You can install PICK directly from GitHub.

Open a terminal.

Clone the repository and enter the project folder:
```bash
git clone https://github.com/RendCoding/PICK.git
cd PICK
```
Run the installer:
```bash
chmod +x install.sh
./install.sh
```
Once the installation finishes, check that PICK works:
```bash
pick -help
```
The installer places PICK in ~/.local/bin/pick and backs up an existing installation and command registry when present. It does not automatically edit your shell configuration, so make sure ~/.local/bin is in your PATH.

You don't need to clone the repository again to use PICK after installation.

## Getting started

Try these commands after installing:

```bash
pick -help
pick -V
pick doctor
pick centre
```

A few other places to start:

```bash
pick config       # edit your custom command registry
pick backup       # create a backup
pick backup -l    # list backups
pick memory       # recipes and saved command knowledge
pick mission      # multi-step workflows
pick repair       # review repair suggestions
pick extension    # manage local extension packs
```

Use `pick -help` to see the commands supported by your installed version. Some commands have interactive subcommands; PICK will show the available options.

## Where PICK keeps things

- **Executable:** `~/.local/bin/pick`
- **Command registry:** `${XDG_CONFIG_HOME:-~/.config}/pick/commands.tsv`
- **Backups:** `${XDG_DATA_HOME:-~/.local/share}/pick/backups/`

The command registry uses one entry per line, in this format:

```text
name|description|command
```

Only add commands you trust. PICK runs custom command entries through Bash, so they can do anything your user account has permission to do.

## A few things to know

- Missions and saved recipes ask for confirmation before running.
- Repair shows suggestions; it does not automatically change your system.
- Extension packs are local-only and are not downloaded or automatically executed.
- Theme support is currently preview-only.
- The installer backs up the existing PICK executable and command registry, when present, before replacing the executable.
- PICK’s installer does not need root privileges. Commands you choose to run may still make changes or require their own permissions.

## Development

Before submitting a change, check the scripts with:

```bash
bash -n pick
bash -n install.sh
```

Those checks catch syntax errors, but they don’t cover every interactive feature or desktop setup. Please test the change on your own system too.

## Contributing

Bug reports, small fixes, and documentation improvements are welcome. When reporting a problem, please include:

- Your Linux distribution and Bash version
- PICK version (`pick -V`)
- The command you ran and the exact output
- Whether relevant optional dependencies are installed

Please leave out personal paths, access tokens, passwords, and other sensitive information from issues.
