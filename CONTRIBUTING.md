# Contributing

Thanks for helping improve PICK.

1. Keep changes focused and document user-visible behaviour in `README.md` and `CHANGELOG.md` when appropriate.
2. Keep the installer user-level; do not add `sudo` requirements without a strong reason.
3. Do not silently edit or assume control of a user's desktop/compositor configuration.
4. Run `bash -n pick` and `bash -n install.sh` before opening a pull request.
5. Test commands in a disposable account or temporary `HOME` when possible, especially anything that writes files or launches commands.
6. Explain optional dependencies and safety implications in the docs.

When reporting a bug, include the PICK version, distro, Bash version, exact command, and output. Redact private paths and secrets.
