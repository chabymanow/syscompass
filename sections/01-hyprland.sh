#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "Hyprland Configuration", "requires": "hyprctl", "files": [["Hyprland main config", "~/.config/hypr/hyprland.conf"], ["Optional Lua configuration (version dependent)", "~/.config/hypr/hyprland.lua"]], "commands": [["Reload configuration", "hyprctl reload", "ACTION"], ["Version", "hyprctl version", "READ"], ["Configuration errors", "hyprctl configerrors", "READ"], ["Live log (Ctrl+C to stop)", "hyprctl rollinglog -f", "READ"], ["Layouts", "hyprctl layouts", "READ"], ["Border size option", "hyprctl getoption general:border_size", "READ"], ["Instances", "hyprctl instances", "READ"], ["Show configured binds", "hyprctl binds", "READ"]]}
SECTION_DATA
