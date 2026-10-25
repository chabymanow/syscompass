#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../lib.sh"
render_section <<'SECTION_DATA'
{"title": "Workspaces & Shortcuts", "requires": "hyprctl", "files": [["Hyprland workspace and binding rules", "~/.config/hypr/hyprland.conf"]], "commands": [["Workspaces", "hyprctl workspaces", "READ"], ["Active workspace", "hyprctl activeworkspace", "READ"], ["Workspace rules", "hyprctl workspacerules", "READ"], ["Keybindings", "hyprctl binds", "READ"], ["Keybinding submap", "hyprctl submap", "READ"], ["Layer surfaces", "hyprctl layers", "READ"], ["Cursor coordinates", "hyprctl cursorpos", "READ"], ["Switch to workspace 2", "hyprctl dispatch workspace 2", "ACTION"], ["Move active window to workspace 2", "hyprctl dispatch movetoworkspace 2", "ACTION"], ["Toggle floating", "hyprctl dispatch togglefloating", "ACTION"]]}
SECTION_DATA
