#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "Windows & Hidden Windows", "requires": "hyprctl", "files": [["Hyprland window rules", "~/.config/hypr/hyprland.conf"]], "commands": [["All managed clients", "hyprctl clients", "READ"], ["Active client", "hyprctl activewindow", "READ"], ["Client JSON", "hyprctl -j clients | jq", "READ"], ["Titles and classes", "hyprctl -j clients | jq -r '.[] | \"\\(.class) | \\(.title)\"'", "READ"], ["Client addresses", "hyprctl -j clients | jq -r '.[] | \"\\(.address) | \\(.class)\"'", "READ"], ["Workspaces", "hyprctl -j clients | jq -r '.[] | \"\\(.class) | workspace \\(.workspace.name)\"'", "READ"], ["Clients on monitor ID 0 (example only)", "hyprctl -j clients | jq -r '.[] | select(.monitor == 0) | .title'", "READ"], ["Move active client to workspace 5", "hyprctl dispatch movetoworkspace 5", "ACTION"], ["Close active client", "hyprctl dispatch killactive", "ACTION"]]}
SECTION_DATA
