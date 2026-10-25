#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "Noctalia Panels & Wallpapers", "requires": "noctalia", "files": [["Noctalia config", "~/.config/noctalia/config.toml"]], "commands": [["Wallpaper selector", "noctalia msg panel-toggle wallpaper", "ACTION"], ["Application launcher", "noctalia msg panel-toggle launcher", "ACTION"], ["Control centre", "noctalia msg panel-toggle control-center", "ACTION"], ["Clipboard", "noctalia msg panel-toggle clipboard", "ACTION"], ["Dock toggle (version dependent)", "noctalia msg dock-toggle", "ACTION"], ["Next wallpaper (version dependent)", "noctalia msg wallpaper-next", "ACTION"], ["Previous wallpaper (version dependent)", "noctalia msg wallpaper-previous", "ACTION"], ["Wallpaper path (version dependent)", "noctalia msg wallpaper-get", "READ"]]}
SECTION_DATA
