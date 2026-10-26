PICK 0.1.8 — release fixes

Install (user-level; no sudo):
  1. Extract this archive.
  2. Open a terminal in the extracted pick-release-0.1.8 folder.
  3. Run: ./install.sh

The installer syntax-checks the script, backs up the existing ~/.local/bin/pick
and commands registry, then installs atomically.

Useful commands:
  pick -help
  pick -V
  pick doctor
  pick centre
  pick memory
  pick mission
  pick repair
  pick extension

0.1.8 fixes a packaging error in 0.1.7 where terminal prompt text was copied
into the beginning and end of the script. It also accepts the common typo
"extenstion" as an alias for "extension".

Safety notes:
- Missions and saved recipes require confirmation before execution.
- Repair is recommendation-only; it does not perform automatic system changes.
- Extension packs are local-only and are not downloaded or auto-executed.
- Theme application remains preview-only.
